library verilog;
use verilog.vl_types.all;
entity g58_human_player_vlg_check_tst is
    port(
        addr            : in     vl_logic_vector(5 downto 0);
        current_card    : in     vl_logic_vector(5 downto 0);
        done            : in     vl_logic;
        draw_enable     : in     vl_logic;
        illegal_play    : in     vl_logic;
        num_cards       : in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end g58_human_player_vlg_check_tst;
