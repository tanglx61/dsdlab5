LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 
LIBRARY lpm;
USE lpm.lpm_components.all;

LIBRARY work;

ENTITY g58_mod13 IS 
	PORT
	(	
		X :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		mod13 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0); -- Can have 13 possible values
		floor13: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) -- Can have 5 possible values
	);
END g58_mod13;

ARCHITECTURE g58_mod13_arch OF g58_mod13 IS

SIGNAL S1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S5 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S6 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S7 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S8 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S9 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL floor32: STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

-- S3 = X * 5 = (x * 4) + X = S1 + S2
S1 <= "000000000000000000000000" & X & "00"; -- X << 2 (X * 4)
S2 <= "00000000000000000000000000" & X;
ADD1: lpm_add_sub
	GENERIC MAP (
		LPM_WIDTH 	  => 32,
		LPM_DIRECTION => "ADD"
		)
	PORT MAP(
		dataa  => S1,
		datab  => S2,
		result => S3 );

-- floor13 = S3 >> 6;
floor32 <= "000000" & S3(31 DOWNTO 6);

-- S7 = floor13 * 13 = (floor13 * 8) + (floor13 * 4) + floor13
-- S7 = (floor13 << 3) + (floor13 << 2) + floor13
S4 <= floor32(28 DOWNTO 0) & "000";
S5 <= floor32(29 DOWNTO 0) & "00";
ADD2: lpm_add_sub
	GENERIC MAP (
		LPM_WIDTH 	  => 32,
		LPM_DIRECTION => "ADD"
		)
	PORT MAP(
		dataa  => S4,
		datab  => S5,
		result => S6 );

ADD3: lpm_add_sub
	GENERIC MAP (
		LPM_WIDTH 	  => 32,
		LPM_DIRECTION => "ADD"
		)
	PORT MAP(
		dataa  => S6,
		datab  => floor32,
		result => S7 );

-- S4 = X - S3
SUB1: lpm_add_sub
	GENERIC MAP (
		LPM_WIDTH 	  => 32,
		LPM_DIRECTION => "SUB"
		)
	PORT MAP(
		dataa  => S2,
		datab  => S7,
		result => S8 );

S9 <= S8(3 DOWNTO 0);
floor13 <= floor32(3 DOWNTO 0);
mod13 <= std_logic_vector(unsigned(S9));

END g58_mod13_arch;