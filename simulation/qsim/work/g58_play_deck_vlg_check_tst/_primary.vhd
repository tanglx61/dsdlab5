library verilog;
use verilog.vl_types.all;
entity g58_play_deck_vlg_check_tst is
    port(
        card            : in     vl_logic_vector(5 downto 0);
        empty           : in     vl_logic;
        full            : in     vl_logic;
        mode            : in     vl_logic_vector(1 downto 0);
        num_cards       : in     vl_logic_vector(5 downto 0);
        ready           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end g58_play_deck_vlg_check_tst;
