onerror {quit -f}
vlib work
vlog -work work dsdlab5.vo
vlog -work work dsdlab5.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.g58_sys_ctrl_fsm_test_vlg_vec_tst
vcd file -direction dsdlab5.msim.vcd
vcd add -internal g58_sys_ctrl_fsm_test_vlg_vec_tst/*
vcd add -internal g58_sys_ctrl_fsm_test_vlg_vec_tst/i1/*
add wave /*
run -all
