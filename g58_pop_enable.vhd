-- this circuit implements the pop_enable
-- 
-- entity name: g58_pop_enable
--
-- Copyright (C) 2017 Omar Akkila, Lixuan Tang
-- Version 1.0
-- Author: Omar Akkila (omar.akkila@mail.mcgill.ca), Lixuan Tang (lixuan.tang@mail.mcgill.ca)
-- Date: 16/02/2017

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.lpm_components.all;

LIBRARY work;

ENTITY g58_pop_enable IS 
	PORT
	(	
		N :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		CLK: IN 	STD_LOGIC;
		P_EN :  OUT  STD_LOGIC_VECTOR(51 DOWNTO 0) 
	);
END g58_pop_enable;

ARCHITECTURE g58_pop_enable_arch OF g58_pop_enable IS


BEGIN


rom_table : lpm_rom
	GENERIC MAP(
		lpm_widthad => 6,	--address is 6 bit
		lpm_numwords => 64,		-- 64 entries
		lpm_outdata => "UNREGISTERED",
		lpm_address_control => "REGISTERED",
		lpm_file => "rom.mif",
		lpm_width => 52		--word is 52 bit
		)

	PORT MAP (inclock => CLK, address => N, q => P_EN);

END g58_pop_enable_arch;