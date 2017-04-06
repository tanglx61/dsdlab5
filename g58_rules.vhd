-- this circuit implements the Rules Module
-- 
-- entity name: g58_rules
--
-- Copyright (C) 2017 Lixuan Tang, Omar Akkila
-- Version 1.0
-- Author: Omar Akkila (omar.akkila@mail.mcgill.ca), Lixuan Tang (lixuan.tang@mail.mcgill.ca)
-- Date: 23/03/2017


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;

ENTITY g58_rules IS 
	PORT
	(	
		play_pile_top_card :  	IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		card_to_play: 			IN 	STD_LOGIC_VECTOR(5 DOWNTO 0);
		legal_play:  			OUT  STD_LOGIC 
	);
END g58_rules;

ARCHITECTURE g58_rules_arch OF g58_rules IS

	SIGNAL top_card_face_value: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL top_card_suit: STD_LOGIC_VECTOR(3 DOWNTO 0);

	SIGNAL play_card_face_value: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL play_card_suit: STD_LOGIC_VECTOR(3 DOWNTO 0);


	COMPONENT g58_mod13 IS 
		PORT
		(	
			X :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			mod13 :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0); 
			floor13: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;

	BEGIN

		top_card_mod13 : g58_mod13
		PORT MAP(
				 X => play_pile_top_card,
				 mod13 => top_card_face_value,
				 floor13 => top_card_suit);


		play_card_mod13 : g58_mod13
		PORT MAP(
				 X => card_to_play,
				 mod13 => play_card_face_value,
				 floor13 => play_card_suit);


		p: PROCESS (top_card_face_value, top_card_suit, play_card_face_value, play_card_suit)
	
		BEGIN
			IF top_card_face_value = "0111" OR play_card_face_value = "0111" OR top_card_suit = play_card_suit OR top_card_face_value = play_card_face_value THEN
				legal_play <= '1';

			ELSE
				legal_play <= '0';

			END IF;

		END PROCESS p;
		

END g58_rules_arch;