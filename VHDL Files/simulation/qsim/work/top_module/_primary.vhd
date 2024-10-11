library verilog;
use verilog.vl_types.all;
entity top_module is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        seg_sec_ones    : out    vl_logic_vector(6 downto 0);
        seg_sec_tens    : out    vl_logic_vector(6 downto 0);
        seg_min_ones    : out    vl_logic_vector(6 downto 0);
        seg_min_tens    : out    vl_logic_vector(6 downto 0);
        seg_hour_ones   : out    vl_logic_vector(6 downto 0);
        seg_hour_tens   : out    vl_logic_vector(6 downto 0)
    );
end top_module;
