library verilog;
use verilog.vl_types.all;
entity top_module_vlg_check_tst is
    port(
        seg_hour_ones   : in     vl_logic_vector(6 downto 0);
        seg_hour_tens   : in     vl_logic_vector(6 downto 0);
        seg_min_ones    : in     vl_logic_vector(6 downto 0);
        seg_min_tens    : in     vl_logic_vector(6 downto 0);
        seg_sec_ones    : in     vl_logic_vector(6 downto 0);
        seg_sec_tens    : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end top_module_vlg_check_tst;
