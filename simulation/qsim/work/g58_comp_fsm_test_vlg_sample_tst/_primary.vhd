library verilog;
use verilog.vl_types.all;
entity g58_comp_fsm_test_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        num_cards       : in     vl_logic_vector(5 downto 0);
        rst             : in     vl_logic;
        scan_next       : in     vl_logic;
        turn            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end g58_comp_fsm_test_vlg_sample_tst;
