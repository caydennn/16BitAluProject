set projDir "D:/Documents/alchitry/16BitAluProject/work/vivado"
set projName "16BitAluProject"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Documents/alchitry/16BitAluProject/work/verilog/au_top_0.v" "D:/Documents/alchitry/16BitAluProject/work/verilog/value_store_1.v" "D:/Documents/alchitry/16BitAluProject/work/verilog/alu_2.v" "D:/Documents/alchitry/16BitAluProject/work/verilog/reset_conditioner_3.v" "D:/Documents/alchitry/16BitAluProject/work/verilog/edge_detector_4.v" "D:/Documents/alchitry/16BitAluProject/work/verilog/button_conditioner_5.v" "D:/Documents/alchitry/16BitAluProject/work/verilog/adder_6.v" "D:/Documents/alchitry/16BitAluProject/work/verilog/boolean_7.v" "D:/Documents/alchitry/16BitAluProject/work/verilog/shifter_8.v" "D:/Documents/alchitry/16BitAluProject/work/verilog/compare_9.v" "D:/Documents/alchitry/16BitAluProject/work/verilog/pipeline_10.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/Documents/alchitry/16BitAluProject/work/constraint/alchitry.xdc" "D:/Documents/alchitry/16BitAluProject/work/constraint/io.xdc" "D:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
