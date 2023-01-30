#!/bin/bash 
#################################################################################################
# author: apaala chatterjee
# description: wrapper script to run Pacbio report
# input: -Path to Rmd
#        -Run Id 
#        -Cell ID
# output: pacbio report output
# requirements: module load r/4.0.3
#               export LD_LIBRARY_PATH=/usr/local/packages/r-4.0.3/lib64/R/lib:$LD_LIBRARY_PATH
#
#
##################################################################################################


module load r/4.0.3
export LD_LIBRARY_PATH=/usr/local/packages/r-4.0.3/lib64/R/lib:$LD_LIBRARY_PATH

export R_HOME=$(R RHOME)
Rexec=${R_HOME}/bin/R

rscript=$1
run_id=$2
cell_id=$3
outdir=$4
projid=$5
basep=$6

cmd1="rmarkdown::render('"
cmd2="',params=list(runid='"
cmd3="',cellid='"
cmd4="',basep='"
cmd5="'),output_dir='"
cmd6="',output_file='"
cmd7="_"
cmd8="_PacBio_Report.pdf')"

$Rexec --vanilla -e $cmd1$rscript$cmd2$run_id$cmd3$cell_id$cmd4$basep$cmd5$outdir$cmd6$run_id$cmd7$cell_id$cmd7$projid$cmd8

echo "Report done"
