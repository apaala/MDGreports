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
cmd5="',pathd='"
cmd6="'),output_dir='"
cmd7="',output_file='"
cmd8="_"
cmd9="_PacBio_Report.pdf')"

$Rexec --vanilla -e $cmd1$rscript$cmd2$run_id$cmd3$cell_id$cmd4$basep$cmd5$outdir$cmd6$outdir$cmd7$run_id$cmd8$cell_id$cmd8$projid$cmd9

echo "Report done"
