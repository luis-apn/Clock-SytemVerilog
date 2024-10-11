onerror {quit -f}
vlib work
vlog -work work Maquinadeestados.vo
vlog -work work Maquinadeestados.vt
vsim -novopt -c -t 1ps -L arriaii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.top_module_vlg_vec_tst
vcd file -direction Maquinadeestados.msim.vcd
vcd add -internal top_module_vlg_vec_tst/*
vcd add -internal top_module_vlg_vec_tst/i1/*
add wave /*
run -all
