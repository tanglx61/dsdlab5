library verilog;
use verilog.vl_types.all;
entity g58_crazy8_complete is
    port(
        player_won      : out    vl_logic;
        clk             : in     vl_logic;
        init_button     : in     vl_logic;
        play_button     : in     vl_logic;
        draw_button     : in     vl_logic;
        up_button       : in     vl_logic;
        down_button     : in     vl_logic;
        comp_won        : out    vl_logic;
        tie             : out    vl_logic;
        illegal_play    : out    vl_logic;
        player_turn     : out    vl_logic;
        comp_turn       : out    vl_logic;
        deal_player     : out    vl_logic;
        deal_comp       : out    vl_logic;
        card_disp       : out    vl_logic_vector(5 downto 0);
        card_display_mode: in     vl_logic;
        num_disp        : out    vl_logic_vector(5 downto 0);
        card_count_display_mode: in     vl_logic_vector(1 downto 0);
        segs_card_count_left: out    vl_logic_vector(6 downto 0);
        segs_card_count_right: out    vl_logic_vector(6 downto 0);
        segs_card_rank  : out    vl_logic_vector(6 downto 0);
        segs_card_suit  : out    vl_logic_vector(6 downto 0)
    );
end g58_crazy8_complete;
