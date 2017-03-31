library verilog;
use verilog.vl_types.all;
entity g58_sys_ctrl_fsm_test is
    port(
        deal_player     : out    vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        player_done     : in     vl_logic;
        comp_done       : in     vl_logic;
        num_cards_comp  : in     vl_logic_vector(5 downto 0);
        num_cards_deck  : in     vl_logic_vector(5 downto 0);
        num_cards_player: in     vl_logic_vector(5 downto 0);
        deal_comp       : out    vl_logic;
        player_turn     : out    vl_logic;
        comp_turn       : out    vl_logic;
        player_won      : out    vl_logic;
        comp_won        : out    vl_logic;
        tie             : out    vl_logic
    );
end g58_sys_ctrl_fsm_test;
