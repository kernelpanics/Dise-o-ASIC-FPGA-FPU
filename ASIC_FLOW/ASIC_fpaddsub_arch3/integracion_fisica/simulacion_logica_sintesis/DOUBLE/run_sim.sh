#!/bin/bash
./$HOME/bash_syn_ibm_2016

vcs -full64 -gui -R -f file_list +v2k +lint=all -l log_name -Mupdate \
+define+DOUBLE  \
+define+FRANCIS_LZD=1  \
-timescale=1ns/1ps   \
+neg_tchk \
+sdfverbose