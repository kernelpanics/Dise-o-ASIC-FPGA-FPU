####################################################################################################################################
#Institución:                          Instituto Tecnológico de Costa Rica
#Autor: Jorge Sequeira Rojas          jsequeira03@gmail.com

#Herramienta:        Design Compiler

#Fecha de creación:

####################################################################################################################################
set PRECISION(0) "SINGLE";
set PRECISION(1) "DOUBLE";
set PREC_PARAM(0) "W=32,SW=23,EW=8,SWR=26,EWR=5";
set PREC_PARAM(1) "W=64,SW=52,EW=11,SWR=55,EWR=6";
# Eliminar diseños previos
set DESIGN_NAME  "fpaddsub_arch2"
set TOP_NAME     "FPU_Add_Subtract_Function"
set SUBMODULE_NAME     "FPU_Add_Subtract_Function"
set CONTRAINTS_FILE_NAME "ASIC_fpaddsub_arch2_syn_constraints.tcl"
remove_design -designs
array set SUBMODULES {Tenth_Phase Oper_Start_In LZD FSM_Add_Subtract Exp_Operation Barrel_Shifter Add_Subt}
#WE PARSE THE FILE_LIST GENERATED OUTSIDE THIS SCRIPT LINK:http://wiki.tcl.tk/367
set fp [open "scripts/file_list" r]
set file_sources [read $fp]
close $fp

set data [split $file_sources "\n"]
#set data "{$data}"
# Primero se analiza el módulo principal

foreach line $data {
  analyze -library WORK -format verilog "$line"
}

set x 0;
set i 0
while {$i < 7} {
while {$x < 2} {

#Elaboramos el módulo principal
elaborate -update $SUBMODULE_NAME($i) -parameters "$PREC_PARAM($x)" -architecture verilog -library WORK

#Enlazar los demás módulos al módulo principal
link

#Escribir el archivo *.ddc (base de datos sin sintetizar)
write -hierarchy -format ddc -output \
./db/$PRECISION($x)/$SUBMODULE_NAME($i)_syn_unmapped.ddc

#Aplicar especificaciones de diseño (constraints)
source $CONTRAINTS_FILE_NAME
propagate_constraints

#Revisar el diseño
check_design

#Compilar el diseño
compile_ultra

#Escribir la lista de nodos a nivel de compuertas (Gate Level Netlist) que se utiliza para:
#- Verificar el funcionamiento lógico del sistema digital después de la Síntesis RTL.
#- Como una de las entradas para el sintetizador físico (IC Compiler).
set verilogout_no_tri true
change_names -hierarchy -rules verilog
write -hierarchy -format verilog -output \
./db/$PRECISION($x)/$SUBMODULE_NAME($i)_syn.v

#Generar los reportes

report_power -analysis_effort high > reports/$DESIGN_NAME_$PRECISION($x)_syn_power.txt
report_area >   reports/$PRECISION($x)/$SUBMODULE_NAME($i)_syn_area.txt
report_cell >   reports/$PRECISION($x)/$SUBMODULE_NAME($i)_syn_cell.txt
report_qor >    reports/$PRECISION($x)/$SUBMODULE_NAME($i)_syn_qor.txt
report_timing > reports/$PRECISION($x)/$SUBMODULE_NAME($i)_syn_timing.txt
report_port >   reports/$PRECISION($x)/$SUBMODULE_NAME($i)_syn_port.txt

#Escribir el archivo *.ddc (base de datos sintetizada)
write -hierarchy -format ddc -output \
./db/$PRECISION($x)/$SUBMODULE_NAME($i)_syn_mapped.ddc

#Escribir el archivo *.sdc (Synopsys Design Constraints), utilizado como una de las entradas
#para el sintetizador físico (IC Compiler)
write_sdc ./db/$PRECISION($x)/$SUBMODULE_NAME($i)_syn.sdc

#Revisar la configuración de temporizado
check_timing

#FINALIZAMOS EL LOOP
set x [expr {$x + 1}]
}
set i [expr {$i + 1}]
}
