library verilog;
use verilog.vl_types.all;
entity g58_crazy8 is
    port(
        player_won      : out    vl_logic;
        init_button     : in     vl_logic;
        clk             : in     vl_logic;
        player_turn     : out    vl_logic;
        card_ready      : out    vl_logic;
        deal_player     : out    vl_logic;
        deal_comp       : out    vl_logic;
        comp_turn       : out    vl_logic;
        card_dealt      : out    vl_logic_vector(5 downto 0);
        top_card        : out    vl_logic_vector(5 downto 0);
        play_button     : in     vl_logic;
        draw_button     : in     vl_logic;
        up_button       : in     vl_logic;
        down_button     : in     vl_logic;
        comp_num_cards  : out    vl_logic_vector(5 downto 0);
        playing_deck_num_cards: out    vl_logic_vector(5 downto 0);
        human_num_cards : out    vl_logic_vector(5 downto 0);
        comp_won        : out    vl_logic;
        tie             : out    vl_logic;
        illegal_play    : out    vl_logic;
        human_current_card: out    vl_logic_vector(5 downto 0)
    );
end g58_crazy8;
