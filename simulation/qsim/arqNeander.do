onerror {quit -f}
vlib work
vlog -work work arqNeander.vo
vlog -work work arqNeander.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.temporizador_vlg_vec_tst
vcd file -direction arqNeander.msim.vcd
vcd add -internal temporizador_vlg_vec_tst/*
vcd add -internal temporizador_vlg_vec_tst/i1/*
add wave /*
run -all
