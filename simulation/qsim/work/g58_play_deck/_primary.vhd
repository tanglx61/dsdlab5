library verilog;
use verilog.vl_types.all;
entity g58_play_deck is
    port(
        empty           : out    vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        req_deal        : in     vl_logic;
        init_button     : in     vl_logic;
        mode            : out    vl_logic_vector(1 downto 0);
        full            : out    vl_logic;
        ready           : out    vl_logic;
        card            : out    vl_logic_vector(5 downto 0);
        num_cards       : out    vl_logic_vector(5 downto 0)
    );
end g58_play_deck;
