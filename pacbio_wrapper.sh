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

#Print usage
#usage="usage:$0 [adaptor_file_in_fqtrim_format] [output suffix,e.g:trimmed.fastq.gz] [input:R1.fq,R2.fq (fa,fq,fq.gz,single or PE)] [--outdir: Output directory for the files]"
#[[ -z $1 ]] && { echo -e "$usage"; exit; }
#[[ -z $2 ]] && { echo -e "Missing output suffix\n$usage"; exit; }
#[[ -z $3 ]] && { echo -e "Missing input files\n$usage"; exit; }

module load r/4.0.3
export LD_LIBRARY_PATH=/usr/local/packages/r-4.0.3/lib64/R/lib:$LD_LIBRARY_PATH

export R_HOME=$(R RHOME)
Rexec=${R_HOME}/bin/R

rscript=$1
run_id=$2
cell_id=$3

cmd1="rmarkdown::render('"
cmd2="',params=list(runid='"
cmd3="',cellid='"
cmd4="'))"

$Rexec --vanilla -e $cmd1$rscript$cmd2$run_id$cmd3$cell_id$cmd4

#$cmd -f $adapters  -o $output_suffix.fastq.gz -r $summary_per_read $input_fastq_files --outdir $outdir 1>>$summary 2>&1 

#echo $cmd 
echo "Report done"
