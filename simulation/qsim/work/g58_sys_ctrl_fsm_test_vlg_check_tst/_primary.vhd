library verilog;
use verilog.vl_types.all;
entity g58_sys_ctrl_fsm_test_vlg_check_tst is
    port(
        comp_turn       : in     vl_logic;
        comp_won        : in     vl_logic;
        deal_comp       : in     vl_logic;
        deal_player     : in     vl_logic;
        player_turn     : in     vl_logic;
        player_won      : in     vl_logic;
        tie             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end g58_sys_ctrl_fsm_test_vlg_check_tst;
