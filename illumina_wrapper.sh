#!/bin/bash 
#################################################################################################
# author: apaala chatterjee
# description: wrapper script to run Illumina report
# input: -Path to Rmd
#        -Run Id 
#        -Project ID
# output: illumina report output
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
proj_id=$3
outdir=$4
basep=$5

cmd1="rmarkdown::render('"
cmd2="',params=list(runid='"
cmd3="',projid='"
cmd4="',basep='"
cmd5="'),output_dir='"
cmd6="',output_file=paste('"
cmd7="','_',Sys.Date(),'_illumina_Report.pdf',sep=''))"

$Rexec --vanilla -e $cmd1$rscript$cmd2$run_id$cmd3$proj_id$cmd4$basep$cmd5$outdir$cmd6$run_id$cell_id$cmd7

echo "Report done"
