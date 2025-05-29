read_liberty -lib -ignore_miss_dir -setattr blackbox /home/pdk/Desktop/VLSI/OpenROAD/test/Nangate45/Nangate45_typ.lib

read_verilog /home/pdk/Desktop/VLSI/OpenROAD/yosystest/9v3_map.v

hierarchy -check -top map9v3

opt

fsm

opt

memory

opt

techmap

opt

flatten





iopadmap -outpad BUF_X2 A:Z -bits

opt

clean

rename -enumerate

write_verilog map9vr_synth.v



stat

show -stretch
