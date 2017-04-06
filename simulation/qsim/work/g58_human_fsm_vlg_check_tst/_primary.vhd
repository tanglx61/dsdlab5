library verilog;
use verilog.vl_types.all;
entity g58_human_fsm_vlg_check_tst is
    port(
        DRAW_ENABLE     : in     vl_logic;
        STACK_ENABLE    : in     vl_logic;
        STACK_MODE      : in     vl_logic_vector(1 downto 0);
        TURN_DONE       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end g58_human_fsm_vlg_check_tst;
