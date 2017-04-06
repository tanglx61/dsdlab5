library verilog;
use verilog.vl_types.all;
entity g58_human_player is
    port(
        done            : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        turn            : in     vl_logic;
        push_card       : in     vl_logic;
        current_card    : out    vl_logic_vector(5 downto 0);
        addr            : out    vl_logic_vector(5 downto 0);
        up_button       : in     vl_logic;
        down_button     : in     vl_logic;
        new_card        : in     vl_logic_vector(5 downto 0);
        play_pile_top_card: in     vl_logic_vector(5 downto 0);
        play_button     : in     vl_logic;
        draw_button     : in     vl_logic;
        illegal_play    : out    vl_logic;
        draw_enable     : out    vl_logic;
        num_cards       : out    vl_logic_vector(5 downto 0)
    );
end g58_human_player;
