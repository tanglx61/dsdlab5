library verilog;
use verilog.vl_types.all;
entity g58_comp_fsm_test_vlg_check_tst is
    port(
        draw_enable     : in     vl_logic;
        pop_enable      : in     vl_logic;
        scan_enable     : in     vl_logic;
        scan_index      : in     vl_logic_vector(5 downto 0);
        stack_mode      : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end g58_comp_fsm_test_vlg_check_tst;
