
LIBRARY ieee;
USE ieee.std_logic_1164.all; 



ENTITY g58_modulo IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Amod2pow31 :  OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END g58_modulo;

ARCHITECTURE g58_modulo_arch OF g58_modulo IS

BEGIN

Amod2pow31 <= '0' & A(30 DOWNTO 0);

END g58_modulo_arch;