remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog " ../rtl/Router_TOP.v ../rtl/fifo_r.v ../rtl/Router_synchronizer.v ../rtl/Router_Register.v ../rtl/Router_FSM.v"

elaborate Router_TOP

link

check_design

current_design  Router_TOP

compile_ultra -no_autoungroup

write_file -f verilog -hier -output Router_netlist.v

