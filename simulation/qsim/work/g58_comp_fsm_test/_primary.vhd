library verilog;
use verilog.vl_types.all;
entity g58_comp_fsm_test is
    port(
        scan_enable     : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        turn            : in     vl_logic;
        scan_next       : in     vl_logic;
        num_cards       : in     vl_logic_vector(5 downto 0);
        draw_enable     : out    vl_logic;
        pop_enable      : out    vl_logic;
        scan_index      : out    vl_logic_vector(5 downto 0);
        stack_mode      : out    vl_logic_vector(1 downto 0)
    );
end g58_comp_fsm_test;
