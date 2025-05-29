create_clock -name clk -period 10 {clock}
set_input_delay -clock clk 1.0 [get_ports N[1]]
set_output_delay -clock clk 1.0 [get_ports counter[1]]
report_checks -path_delay max
report_checks -path_delay max -from _239_/CK
