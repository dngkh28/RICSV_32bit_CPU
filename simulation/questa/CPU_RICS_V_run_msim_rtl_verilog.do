transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog  -work work +incdir+/home/thu/altera_lite/25.1std/Work_space {/home/thu/altera_lite/25.1std/Work_space/alu.v}

