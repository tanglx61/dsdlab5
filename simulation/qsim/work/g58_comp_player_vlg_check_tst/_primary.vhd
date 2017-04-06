library verilog;
use verilog.vl_types.all;
entity g58_comp_player_vlg_check_tst is
    port(
        current_card    : in     vl_logic_vector(5 downto 0);
        done            : in     vl_logic;
        draw_enable     : in     vl_logic;
        legal_play      : in     vl_logic;
        num_cards       : in     vl_logic_vector(5 downto 0);
        scan_enable     : in     vl_logic;
        scan_index      : in     vl_logic_vector(5 downto 0);
        scan_next       : in     vl_logic;
        stack_mode      : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end g58_comp_player_vlg_check_tst;
