library verilog;
use verilog.vl_types.all;
entity g58_crazy8_complete_vlg_check_tst is
    port(
        card_disp       : in     vl_logic_vector(5 downto 0);
        comp_turn       : in     vl_logic;
        comp_won        : in     vl_logic;
        deal_comp       : in     vl_logic;
        deal_player     : in     vl_logic;
        illegal_play    : in     vl_logic;
        num_disp        : in     vl_logic_vector(5 downto 0);
        player_turn     : in     vl_logic;
        player_won      : in     vl_logic;
        segs_card_count_left: in     vl_logic_vector(6 downto 0);
        segs_card_count_right: in     vl_logic_vector(6 downto 0);
        segs_card_rank  : in     vl_logic_vector(6 downto 0);
        segs_card_suit  : in     vl_logic_vector(6 downto 0);
        tie             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end g58_crazy8_complete_vlg_check_tst;
