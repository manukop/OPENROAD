read_liberty /home/pdk/Desktop/VLSI/OpenROAD/test/gcd_test/Nangate45_slow.lib
read_verilog /home/pdk/Desktop/VLSI/OpenROAD/test/gcd_test/gcd_nangate45.v
link_design gcd
read_sdc /home/pdk/Desktop/VLSI/OpenROAD/test/gcd_test/gcd_nangate45.sdc
report_checks
report_parasitic_annotation
read_spef /home/pdk/Desktop/VLSI/OpenROAD/src/sta/examples/gcd_sky130hd.spef
report_parasitic_annotation
report_checks
report_checks -path_delay max
report_checks -path_delay max -digits 4
report_checks -path_delay max -digits 4 -fields capacitance 
report_checks -path_delay max -digits 4 -fields [list capacitance, slew, input_pins, nets, fanout]
report_checks -path_delay min

exit 
