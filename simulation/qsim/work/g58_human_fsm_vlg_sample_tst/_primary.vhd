library verilog;
use verilog.vl_types.all;
entity g58_human_fsm_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        DRAW_BUTTON     : in     vl_logic;
        LEGAL_PLAY      : in     vl_logic;
        PUSH_ENABLE     : in     vl_logic;
        RST             : in     vl_logic;
        TURN            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end g58_human_fsm_vlg_sample_tst;
