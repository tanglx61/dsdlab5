LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
LIBRARY lpm;
USE lpm.lpm_components.all;

LIBRARY work;

ENTITY g58_mod10 IS 
	PORT
	(	
		X :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		mod10 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0); -- Can have 10 possible values
		floor10: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) -- Can have 6 possible values
	);
END g58_mod10;

ARCHITECTURE g58_mod10_arch OF g58_mod10 IS

SIGNAL S1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S9 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL X32: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL floor32: STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

X32 <= "00000000000000000000000000" & X;

-- X * 13 = (X * 8) + (X * 4) + X
-- S3 = (X * 8) + (X * 4)
S1 <= "00000000000000000000000" & X & "000"; -- X << 3 (X * 8) 
S2 <= "000000000000000000000000" & X & "00"; -- X << 2 (X * 4)
ADD1: lpm_add_sub
	GENERIC MAP (
		LPM_WIDTH     => 32,
		LPM_DIRECTION => "ADD"
		)
	PORT MAP(
		dataa  => S1,
		datab  => S2,
		result => S3 );

-- S4 = S3 + X
ADD2: lpm_add_sub
	GENERIC MAP (
		LPM_WIDTH     => 32,
		LPM_DIRECTION => "ADD"
		)
	PORT MAP(
		dataa  => S3,
		datab  => X32,
		result => S4 );

-- floor10 = S4 >> 7;
floor32 <= "0000000" & S4(31 DOWNTO 7);

-- S7 = floor32 * 10 = (floor32 * 8) + floor32 + floor32
-- S6 = (floor32 * 8) + floor32
-- S5 = floor32 * 8
S5 <= floor32(28 DOWNTO 0) & "000";
ADD3: lpm_add_sub
	GENERIC MAP (
		LPM_WIDTH     => 32,
		LPM_DIRECTION => "ADD"
		)
	PORT MAP(
		dataa  => S5,
		datab  => floor32,
		result => S6 );
ADD4: lpm_add_sub
	GENERIC MAP (
		LPM_WIDTH     => 32,
		LPM_DIRECTION => "ADD"
		)
	PORT MAP(
		dataa  => S6,
		datab  => floor32,
		result => S7 );

-- S8 = X - S7
SUB1: lpm_add_sub
	GENERIC MAP (
		LPM_WIDTH     => 32,
		LPM_DIRECTION => "SUB"
		)
	PORT MAP(
		dataa  => X32,
		datab  => S7,
		result => S8 );

S9 <= S8(3 DOWNTO 0);
floor10 <= floor32(3 DOWNTO 0);
mod10 <= std_logic_vector(unsigned(S9));

END g58_mod10_arch;