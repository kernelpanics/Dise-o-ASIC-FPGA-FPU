#!/bin/bash
#IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat copy_sources.sh))'
#echo "${XYZ[5]}"

#for i in "${IFS[@]}"
#do
#  cp $i -
#done

# dir_list=(ASIC_cordic_Arch2 ASIC_cordic_Arch3 ASIC_fpaddsub_arch2 ASIC_fpaddsub_arch3 ASIC_fpmult_arch2 ASIC_fpmult_arch3 ASIC_KOA ASIC_RKOA)
# for i in "${dir_list[@]}"
# do

# done

#find $PWD -type d -name "source" -exec cp -Rp temp '{}' \;

#ln --symbolic ../my_sourcefiles DESTINY
ls >dir_list
sed -i '/dir_list/d' dir_list  #borramos en las dependencias el nombre del mismo archivo que lleva las dependencias

IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat dir_list))'
#echo "${XYZ[5]}"
for i in "${IFS[@]}"
do
 ln --symbolic $i ${i}_sym
done
