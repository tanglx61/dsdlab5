library verilog;
use verilog.vl_types.all;
entity g58_crazy8_vlg_check_tst is
    port(
        card_dealt      : in     vl_logic_vector(5 downto 0);
        card_ready      : in     vl_logic;
        comp_num_cards  : in     vl_logic_vector(5 downto 0);
        comp_turn       : in     vl_logic;
        comp_won        : in     vl_logic;
        deal_comp       : in     vl_logic;
        deal_player     : in     vl_logic;
        human_current_card: in     vl_logic_vector(5 downto 0);
        human_num_cards : in     vl_logic_vector(5 downto 0);
        illegal_play    : in     vl_logic;
        player_turn     : in     vl_logic;
        player_won      : in     vl_logic;
        playing_deck_num_cards: in     vl_logic_vector(5 downto 0);
        tie             : in     vl_logic;
        top_card        : in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end g58_crazy8_vlg_check_tst;
