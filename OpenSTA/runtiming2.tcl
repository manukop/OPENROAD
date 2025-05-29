
read_liberty  /home/pdk/Desktop/VLSI/OpenROAD/test/gcd_test/Nangate45_typ.lib
read_verilog /home/pdk/Desktop/VLSI/OpenROAD/test/gcd_test/map9vr_synth.v
link_design map9v3
read_sdc /home/pdk/Desktop/VLSI/OpenROAD/test/gcd_test/map9v3.sdc
report_checks -path_delay min_max
set_timing_derate -early 0.9
set_timing_derate -late 1.1
report_checks -path_delay min_max
report_checks -corner typ

exit 
