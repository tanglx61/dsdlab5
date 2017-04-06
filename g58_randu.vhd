-- this circuit implements the IBM RANDU version of linear congruential generator
-- 
-- entity name: g58_RANDU
--
-- Copyright (C) 2017 Omar Akkila, Lixuan Tang
-- Version 1.0
-- Author: Omar Akkila (omar.akkila@mail.mcgill.ca), Lixuan Tang (lixuan.tang@mail.mcgill.ca)
-- Date: 15/02/2017

LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

LIBRARY work;

ENTITY g58_randu IS 
	PORT
	(	
		seed :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		rand :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0) 
	);
END g58_randu;

ARCHITECTURE g58_randu_arch OF g58_randu IS

COMPONENT g58_modulo
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Amod2pow31 :  OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL A : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL Amod2pow31 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S3 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL S5 : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

-- To represent seed * 65539, we know 65539 is 10000000000000011 giving us 
-- seed * 65539 = (seed * 2^16) + (seed * 2^1) + (seed)
-- OR
-- seed * 65539 = (seed << 16) + (seed << 1) + (seed) where 'x << y' left shifts x by y bits
S1 <= seed(15 DOWNTO 0) & "0000000000000000"; -- seed << 16
S2 <= seed(30 DOWNTO 0) & '0';  			  -- seed << 1

-- S3 = S1 + S2
-- i.e. S3 = (seed << 16) + (seed << 1)
ADD1: lpm_add_sub
	GENERIC MAP (
		LPM_WIDTH 	  => 32,
		LPM_DIRECTION => "ADD"
		)
	PORT MAP(
		dataa  => S1,
		datab  => S2,
		result => S3 );

-- S4 = S3 + seed
-- i.e. S4 = (seed << 16) + (seed << 1) + (seed)
ADD2: lpm_add_sub
	GENERIC MAP (
		LPM_WIDTH     => 32,
		LPM_DIRECTION => "ADD"
		)
	PORT MAP(
		dataa  => S3,
		datab  => seed,
		result => S4 );

-- S5 - mod(S4, 2^31)
g58_modulo_inst : g58_modulo
PORT MAP(
	A => S4,
	Amod2pow31 => S5);

rand <= S5;

END g58_randu_arch;