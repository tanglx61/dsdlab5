LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY g58_human_fsm IS
	PORT( CLK, RST, TURN : IN STD_LOGIC;
		  PUSH_ENABLE: IN STD_LOGIC;
		  LEGAL_PLAY: IN STD_LOGIC;
		  DRAW_BUTTON: IN STD_LOGIC;
		  DRAW_ENABLE, STACK_ENABLE, TURN_DONE : OUT STD_LOGIC;
		  STACK_MODE: OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END g58_human_fsm;

ARCHITECTURE g58_human_fsm_arch OF g58_human_fsm IS

TYPE State_type IS (A, B, C, D);
SIGNAL state : State_type;

-- State A is state where we wait for TURN to go high
-- State B is state where we wait for either legal_play or draw_button to go high
-- State C is where legal play is being played
-- State D is where draw button is pressed
BEGIN
	PROCESS ( RST, CLK ) -- process is executed when either RST or CLK has changed
	BEGIN
		IF RST = '1' THEN
			state <= A;
		ELSIF (CLK'EVENT AND CLK = '1') THEN -- rising edge
			CASE state IS
				WHEN A =>
					IF TURN = '0' THEN
						state <= A ;
					ELSE
						state <= B ;
					END IF;
				WHEN B =>
					IF LEGAL_PLAY = '1' THEN
						state <= C;
					ELSIF DRAW_BUTTON = '1' THEN
						state <= D;
					END IF;
				WHEN C =>
					state <= A;
				WHEN D =>
					state <= A;
		
			END CASE ;
		END IF ;
	END PROCESS ;

	STACK_ENABLE <= '1' WHEN state = C OR state = D OR PUSH_ENABLE = '1' ELSE '0';
	STACK_MODE <= 	"01" WHEN state = D OR PUSH_ENABLE = '1' ELSE	-- put the stack into push mode, this is when we draw a new card
					"11" WHEN state = C  -- this is when a legal card has been found, put stack into pop mode
					ELSE "00";	-- else put it in NOP mode.
	DRAW_ENABLE   <= '1' WHEN state = D ELSE '0';

	TURN_DONE <= '1' WHEN state = C OR state = D ELSE '0';

	
END g58_human_fsm_arch; 