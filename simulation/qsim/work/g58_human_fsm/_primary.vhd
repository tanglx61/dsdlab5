library verilog;
use verilog.vl_types.all;
entity g58_human_fsm is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        TURN            : in     vl_logic;
        PUSH_ENABLE     : in     vl_logic;
        LEGAL_PLAY      : in     vl_logic;
        DRAW_BUTTON     : in     vl_logic;
        DRAW_ENABLE     : out    vl_logic;
        STACK_ENABLE    : out    vl_logic;
        TURN_DONE       : out    vl_logic;
        STACK_MODE      : out    vl_logic_vector(1 downto 0)
    );
end g58_human_fsm;
