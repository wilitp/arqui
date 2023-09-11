transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules {/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules/writeback.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules {/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules/processor_arm.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules {/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules/memory.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules {/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules/decode.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules {/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules/datapath.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules {/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules/controller.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules {/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules/aludec.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor {/home/guille/famaf/arqui/SingleCycleProcessor/execute.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor {/home/guille/famaf/arqui/SingleCycleProcessor/mux2.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor {/home/guille/famaf/arqui/SingleCycleProcessor/adder.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor {/home/guille/famaf/arqui/SingleCycleProcessor/fetch.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor {/home/guille/famaf/arqui/SingleCycleProcessor/flopr.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor {/home/guille/famaf/arqui/SingleCycleProcessor/signext.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor {/home/guille/famaf/arqui/SingleCycleProcessor/alu.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor {/home/guille/famaf/arqui/SingleCycleProcessor/imem.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor {/home/guille/famaf/arqui/SingleCycleProcessor/regfile.sv}
vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor {/home/guille/famaf/arqui/SingleCycleProcessor/maindec.sv}
vcom -2008 -work work {/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules/dmem.vhd}

vlog -sv -work work +incdir+/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules {/home/guille/famaf/arqui/SingleCycleProcessor/patterson_modules/processor_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all
