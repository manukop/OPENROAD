read_libraries
read_verilog /home/pdk/Desktop/VLSI/OpenROAD/test/gcd_test/gcd_nangate45.v
link_design gcd
read_sdc /home/pdk/Desktop/VLSI/OpenROAD/test/gcd_test/gcd_nangate45.sdc

set_thread_count [cpu_count]
# Temporarily disable sta's threading due to random failures
sta::set_thread_count 1

utl::metric "IFP::ord_version" [ord::openroad_git_describe]
# Note that sta::network_instance_count is not valid after tapcells are added.
utl::metric "IFP::instance_count" [sta::network_instance_count]

initialize_floorplan -site $site \
  -die_area $die_area \
  -core_area $core_area
write_def gcd_test/post_floorplan.def
source $tracks_file

# remove buffers inserted by synthesis 
remove_buffers

################################################################
# IO Placement (random)
place_pins -random -hor_layers $io_placer_hor_layer -ver_layers $io_placer_ver_layer

################################################################
# Macro Placement
if { [have_macros] } {
  lassign $macro_place_halo halo_x halo_y
  set report_dir [make_result_file ${design}_${platform}_rtlmp]
  rtl_macro_placer -halo_width $halo_x -halo_height $halo_y \
      -report_directory $report_dir
}
write_def gcd_test/post_macroplacement.def
################################################################
# Tapcell insertion
eval tapcell $tapcell_args
write_def gcd_test/post_tapcell.def
