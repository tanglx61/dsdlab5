LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY g58_sys_ctrl_fsm IS
	PORT( 
		rst:				IN STD_LOGIC;
		clk: 				IN STD_LOGIC;
		player_done: 		IN STD_LOGIC;
		comp_done : 		IN STD_LOGIC;
		num_cards_player: 	IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		num_cards_comp:		IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		num_cards_deck: 	IN STD_LOGIC_VECTOR(5 DOWNTO 0);

		deal_player:		OUT STD_LOGIC;
		deal_comp:			OUT STD_LOGIC;
		player_turn:		OUT STD_LOGIC;
		comp_turn:			OUT STD_LOGIC;
		player_won:			OUT STD_LOGIC;
		comp_won:			OUT STD_LOGIC;
		tie:				OUT STD_LOGIC
		);
END g58_sys_ctrl_fsm;

ARCHITECTURE g58_sys_ctrl_fsm_arch OF g58_sys_ctrl_fsm IS

TYPE State_type IS (I, A, B, C, D, X, Y, W);

SIGNAL state : State_type := I;

-- State I is the initial state where we are waiting for rst signal to go hig
-- State A is where the human player cards are initiliazed. This state is maintained until enough cards have been dealt to the human player
-- State B is where the computer player cards are initialized. This state is maintained until enough cards have been dealt to the computer player
-- State C is where we wait for the human player to play their turn (player_done to go high)
-- State D is where we wait for the computer player to play their turn (comp_done to go high)
-- State X is where we declare the human player has won (player_won = '1')
-- State Y is where we declare the comp player has won (comp_won = '1')
-- State W is where we declare the game has been tied

BEGIN

	PROCESS (rst, clk) -- process is executed when either rst or clk has changed
	BEGIN
		IF rst = '1' THEN
			state <= A;

		ELSIF (clk'EVENT AND clk = '1') THEN -- rising edge
			CASE state IS
				WHEN I =>
					IF rst = '1' THEN
						state <= A;
					ELSE 
						state <= I;
					END IF;
				WHEN A =>
					IF to_integer(unsigned(num_cards_player)) < 7 THEN
						state <= A;
					ELSE 
						state <= B;
					END IF;

				WHEN B => 
					IF to_integer(unsigned(num_cards_comp)) < 7 THEN
						state <= B;
					ELSE 
						state <= C;
					END IF;

				WHEN C =>
					IF to_integer(unsigned(num_cards_player)) = 0 THEN
						state <= X;
					ELSIF to_integer(unsigned(num_cards_comp)) = 0 THEN
						state <= Y;
					ELSIF to_integer(unsigned(num_cards_deck)) = 0 THEN 
						state <= W;
					ELSIF player_done = '1' THEN
						state <= D;
					ELSE 
						state <= C;
					END IF;

				WHEN D =>
					IF to_integer(unsigned(num_cards_player)) = 0 THEN
						state <= X;
					ELSIF to_integer(unsigned(num_cards_comp)) = 0 THEN
						state <= Y;
					ELSIF to_integer(unsigned(num_cards_deck)) = 0 THEN 
						state <= W;
					ELSIF comp_done = '1' THEN
						state <= C;
					ELSE 
						state <= D;
					END IF;

				WHEN X =>
					state <= X;

				WHEN Y =>
					state <= Y;

				WHEN W => 
					state <= W;

			END CASE;
		END IF;

	END PROCESS;

	

	
	deal_player  <= '1' WHEN state = A ELSE '0';
	deal_comp <= '1' WHEN state = B ELSE '0';
	player_turn <= '1' WHEN state = C ELSE '0';
	comp_turn <= '1' WHEN state = D ELSE '0';
	player_won <= '1' WHEN state = X ELSE '0';
	comp_won <= '1' WHEN state = Y ELSE '0';
	tie <= '1' WHEN state = W ELSE '0';

END g58_sys_ctrl_fsm_arch; 