# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.cache/wt [current_project]
set_property parent.project_path /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/Karatsubas/Karatsubas.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib /home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/my_sourcefiles/Source_Files/Multipliers/26bit/ReCodeRKOARecursive/RKOA_Recursive.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top Recursive_KOA -part xc7a100tcsg324-1 -max_dsp 0


write_checkpoint -force -noxdef Recursive_KOA.dcp

catch { report_utilization -file Recursive_KOA_utilization_synth.rpt -pb Recursive_KOA_utilization_synth.pb }
