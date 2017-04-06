LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY g58_dealerfsm IS
	PORT( Clock, Resetn, Request_Deal, RAND_LT_NUM : IN STD_LOGIC;
		  Rand_Enable, Stack_Enable: OUT STD_LOGIC);
END g58_dealerfsm;

ARCHITECTURE g58_dealerfsm_arch OF g58_dealerfsm IS

TYPE State_type IS (A, B, C, D);
SIGNAL y : State_type;
-- State A is state where we wait for Request_Deal to go low
-- State B is state where we wait for Request_Deal to go high
-- State C is where Rand_Enable is asserted
-- State D is where Stack_Enable is asserted 
BEGIN
	PROCESS ( Resetn, Clock ) -- process is executed when either Resetn or Clock has changed
	BEGIN
		IF Resetn= '1' THEN
			y  <= A;
		ELSIF (Clock'EVENT AND Clock = '1') THEN -- rising edge
			CASE y IS
				WHEN A =>
					IF Request_Deal = '1' THEN
						y <= A ;
					ELSE
						y <= B ;
					END IF;
				WHEN B =>
					IF Request_Deal = '0' THEN
						y <= B ;
					ELSE
						y <= C ;
					END IF ;
				WHEN C =>
					IF RAND_LT_NUM = '0' THEN
						y <= C ;
					ELSE
						y <= D;
					END IF;
				WHEN D =>
					y <= A;
			END CASE ;
		END IF ;
	END PROCESS ;
	Rand_Enable  <= '1' WHEN y = C ELSE '0';
	Stack_Enable <= '1' WHEN y = D ELSE '0';
END g58_dealerfsm_arch; 