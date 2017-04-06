library verilog;
use verilog.vl_types.all;
entity g58_comp_player_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        new_card        : in     vl_logic_vector(5 downto 0);
        play_pile_top_card: in     vl_logic_vector(5 downto 0);
        push_card       : in     vl_logic;
        rst             : in     vl_logic;
        turn            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end g58_comp_player_vlg_sample_tst;
