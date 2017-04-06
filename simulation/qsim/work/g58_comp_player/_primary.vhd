library verilog;
use verilog.vl_types.all;
entity g58_comp_player is
    port(
        scan_enable     : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        turn            : in     vl_logic;
        scan_next       : out    vl_logic;
        legal_play      : out    vl_logic;
        current_card    : out    vl_logic_vector(5 downto 0);
        push_card       : in     vl_logic;
        scan_index      : out    vl_logic_vector(5 downto 0);
        new_card        : in     vl_logic_vector(5 downto 0);
        stack_mode      : out    vl_logic_vector(1 downto 0);
        play_pile_top_card: in     vl_logic_vector(5 downto 0);
        num_cards       : out    vl_logic_vector(5 downto 0);
        draw_enable     : out    vl_logic;
        done            : out    vl_logic
    );
end g58_comp_player;
