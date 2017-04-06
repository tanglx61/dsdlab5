LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY g58_comp_fsm IS
	PORT( CLK, RST, TURN, SCAN_NEXT : IN STD_LOGIC;
		  NUM_CARDS : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		  PUSH_ENABLE: IN STD_LOGIC;
		  SCAN_INDEX : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		  SCAN_ENABLE, DRAW_ENABLE, POP_ENABLE : OUT STD_LOGIC;
		  STACK_MODE: OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END g58_comp_fsm;

ARCHITECTURE g58_comp_fsm_arch OF g58_comp_fsm IS

TYPE State_type IS (A, B, C, D, L);
SIGNAL y : State_type;
SIGNAL CURRENT_INDEX : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL CURR_IDX : STD_LOGIC_VECTOR(5 DOWNTO 0);
-- State A is state where we wait for TURN to go high
-- State B is state where we wait for scan our cards
-- State C is state all cards are invalid plays
-- State L is when a legal play has been found
BEGIN
	PROCESS ( RST, CLK ) -- process is executed when either RST or CLK has changed
	BEGIN
		IF RST = '1' THEN
			y <= A;
		ELSIF (CLK'EVENT AND CLK = '1') THEN -- rising edge
			CASE y IS
				WHEN A =>
					IF TURN = '0' THEN
						y <= A ;
					ELSE
						y <= B ;
					END IF;
				WHEN B =>
					IF unsigned(CURRENT_INDEX) >= unsigned(NUM_CARDS) THEN
						y <= D;
					ELSE
						y <= C;
					END IF;
				WHEN C =>
					IF SCAN_NEXT = '1' THEN
						y <= B;
						CURR_IDX <= STD_LOGIC_VECTOR(unsigned(CURR_IDX) + 1);
						
					ELSE
						y <= L;
					END IF;
				WHEN D =>
					y <= A;
				
				WHEN L => 
					Y <= A;
			END CASE ;
		END IF ;
	END PROCESS ;
	SCAN_ENABLE   <= '1' WHEN y = B ELSE '0';
	SCAN_INDEX 	  <= CURR_IDX;
	DRAW_ENABLE   <= '1' WHEN y = D ELSE '0';
	CURRENT_INDEX <= "000000" WHEN y = C OR y = A ELSE CURR_IDX;
	POP_ENABLE <= '1' WHEN y = L ELSE '0';
	STACK_MODE <= "01" WHEN y = D OR PUSH_ENABLE = '1' ELSE	-- put the stack into push mode, this is when we draw a new card
						"11" WHEN y = L  -- this is when a legal card has been found, put stack into pop mode
						ELSE "00";	-- else put it in NOP mode.
END g58_comp_fsm_arch; 