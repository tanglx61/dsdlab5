-- this circuit implements the 7-segment LED control
-- 
-- entity name: g58_RANDU
--
-- Copyright (C) 2017 Omar Akkila, Lixuan Tang
-- Version 1.0
-- Author: Omar Akkila (omar.akkila@mail.mcgill.ca), Lixuan Tang (lixuan.tang@mail.mcgill.ca)
-- Date: 17/02/2017

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;

ENTITY g58_7_segment_decoder IS 
	PORT
	(
		code :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		mode :  IN STD_LOGIC;
		segments_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END g58_7_segment_decoder;

ARCHITECTURE g58_7_segment_decoder_arch OF g58_7_segment_decoder IS

SIGNAL xcode :STD_LOGIC_VECTOR(4 DOWNTO 0);

BEGIN

xcode(4 DOWNTO 1) <= code;
xcode(0) <= mode;

WITH xcode SELECT
segments_out <= 

	-- mode 0
	"1000000" WHEN "00000",	-- 0
	"1111001" WHEN "00010", -- 1
	"0100100" WHEN "00100", -- 2
	"0110000" WHEN "00110",	-- 3
	"0011001" WHEN "01000",	-- 4
	"0010010" WHEN "01010",	-- 5
	"0000010" WHEN "01100",	-- 6
	"1111000" WHEN "01110",	-- 7
	"0000000" WHEN "10000",	-- 8
	"0010000" WHEN "10010",	-- 9
	"0001000" WHEN "10100",	-- A
	"0000011" WHEN "10110",	-- B
	"1000110" WHEN "11000",	-- C
	"0100001" WHEN "11010",	-- D
	"0000110" WHEN "11100",	-- E
	"0001110" WHEN "11110",	-- F

	-- mode 1
	"0001000" WHEN "00001",	-- A
	"0100100" WHEN "00011", -- 2
	"0110000" WHEN "00101",	-- 3
	"0011001" WHEN "00111",	-- 4
	"0010010" WHEN "01001",	-- 5
	"0000010" WHEN "01011",	-- 6
	"1111000" WHEN "01101",	-- 7
	"0000000" WHEN "01111",	-- 8
	"0010000" WHEN "10001",	-- 9
	"1000000" WHEN "10011",	-- 0
	"1100001" WHEN "10101",	-- J
	"0100011" WHEN "10111",	-- Q
	"0001001" WHEN "11001",	-- K
	"0111111" WHEN "11011",	-- -
	"0111111" WHEN "11101",	-- -
	"0111111" WHEN "11111",	-- -
	"1111111" WHEN OTHERS;

END g58_7_segment_decoder_arch;