library verilog;
use verilog.vl_types.all;
entity g58_play_deck_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        init_button     : in     vl_logic;
        req_deal        : in     vl_logic;
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end g58_play_deck_vlg_sample_tst;
