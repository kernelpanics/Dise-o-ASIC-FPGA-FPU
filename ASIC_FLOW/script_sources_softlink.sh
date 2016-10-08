#!/bin/bash
#IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat copy_sources.sh))'
#echo "${XYZ[5]}"

#for i in "${IFS[@]}"
#do
#  cp $i -
#done

dir_list=(ASIC_cordic_Arch2 ASIC_cordic_Arch3 ASIC_fpaddsub_arch2 ASIC_fpaddsub_arch3 ASIC_fpmult_arch2 ASIC_fpmult_arch3 ASIC_KOA ASIC_RKOA)
for i in "${dir_list[@]}"
do
  ln --symbolic ../my_sourcefiles/Source_Files/FPU_Interface $i/integracion_fisica/front_end/source/FPU_Interface
done

#find $PWD -type d -name "source" -exec cp -Rp temp '{}' \;

#ln --symbolic ../my_sourcefiles DESTINY
