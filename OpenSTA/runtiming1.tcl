define_corners wc typ bc
read_liberty -corner wc /home/pdk/Desktop/VLSI/OpenROAD/test/gcd_test/Nangate45_slow.lib
read_liberty -corner typ /home/pdk/Desktop/VLSI/OpenROAD/test/gcd_test/Nangate45_typ.lib
read_liberty -corner bc /home/pdk/Desktop/VLSI/OpenROAD/test/gcd_test/Nangate45_fast.lib
read_verilog /home/pdk/Desktop/VLSI/OpenROAD/test/gcd_test/example1.v
link_design gcd
create_clock -name clk -period 10 {clk1 clk2 clk3}
set_input_delay -clock clk 0 {in1 in2}
report_checks -path_delay min_max
set_timing_derate -early 0.9
set_timing_derate -late 1.1
report_checks -path_delay min_max
report_checks -corner typ

exit 
