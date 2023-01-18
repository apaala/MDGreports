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

cmd1="rmarkdown::render('"
cmd2="',params=list(runid='"
cmd3="',cellid='"
cmd4="'),output_dir='"
cmd5="',output_file=paste('"
cmd6="_"
cmd7="','_',Sys.Date(),'_pacbio_Report.pdf',sep=''))"

$Rexec --vanilla -e $cmd1$rscript$cmd2$run_id$cmd3$cell_id$cmd4$outdir$cmd5$run_id$cmd6$cell_id$cmd6$projid$cmd7

echo "Report done"
