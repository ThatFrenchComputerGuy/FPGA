connect -url tcp:127.0.0.1:3121
source C:/FPGA/lect7_2/led_axi_lite_1/led_axi_lite_1.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351A6B3EEA"} -index 0
loadhw -hw C:/FPGA/lect7_2/led_axi_lite_1/led_axi_lite_1.sdk/design_1_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351A6B3EEA"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo Z7 210351A6B3EEA"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo Z7 210351A6B3EEA"} -index 0
dow C:/FPGA/lect7_2/led_axi_lite_1/led_axi_lite_1.sdk/myip_test/Debug/myip_test.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo Z7 210351A6B3EEA"} -index 0
con
