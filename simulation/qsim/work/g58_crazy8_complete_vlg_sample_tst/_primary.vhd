library verilog;
use verilog.vl_types.all;
entity g58_crazy8_complete_vlg_sample_tst is
    port(
        card_count_display_mode: in     vl_logic_vector(1 downto 0);
        card_display_mode: in     vl_logic;
        clk             : in     vl_logic;
        down_button     : in     vl_logic;
        draw_button     : in     vl_logic;
        init_button     : in     vl_logic;
        play_button     : in     vl_logic;
        up_button       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end g58_crazy8_complete_vlg_sample_tst;
