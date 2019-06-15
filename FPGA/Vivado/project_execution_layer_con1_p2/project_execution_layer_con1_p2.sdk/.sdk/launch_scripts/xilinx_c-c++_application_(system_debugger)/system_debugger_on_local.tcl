connect -url tcp:127.0.0.1:3121
source C:/Users/RA_prof_Jeon/siddharth/Vivado/project_execution_layer_con1_p2/project_execution_layer_con1_p2.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A1BEAA"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT2 210251A1BEAA" && level==0} -index 1
fpga -file C:/Users/RA_prof_Jeon/siddharth/Vivado/project_execution_layer_con1_p2/project_execution_layer_con1_p2.sdk/design_1_wrapper_hw_platform_0/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A1BEAA"} -index 0
loadhw -hw C:/Users/RA_prof_Jeon/siddharth/Vivado/project_execution_layer_con1_p2/project_execution_layer_con1_p2.sdk/design_1_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A1BEAA"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A1BEAA"} -index 0
dow C:/Users/RA_prof_Jeon/siddharth/Vivado/project_execution_layer_con1_p2/project_execution_layer_con1_p2.sdk/alexnet/Debug/alexnet.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A1BEAA"} -index 0
con
