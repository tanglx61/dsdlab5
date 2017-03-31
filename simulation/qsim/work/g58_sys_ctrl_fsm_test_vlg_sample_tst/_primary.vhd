library verilog;
use verilog.vl_types.all;
entity g58_sys_ctrl_fsm_test_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        comp_done       : in     vl_logic;
        num_cards_comp  : in     vl_logic_vector(5 downto 0);
        num_cards_deck  : in     vl_logic_vector(5 downto 0);
        num_cards_player: in     vl_logic_vector(5 downto 0);
        player_done     : in     vl_logic;
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end g58_sys_ctrl_fsm_test_vlg_sample_tst;
