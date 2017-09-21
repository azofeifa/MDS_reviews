#!/bin/bash

qsub_template=/scratch/Shares/dowell/md_score_paper/useful_qsub_scripts/mds.sh





fasta=/scratch/Shares/dowell/md_score_paper/support_files/hg19.fa
DB=/scratch/Shares/dowell/md_score_paper/support_files/HOCOMOCO_human.txt
FILES=/Users/azofeifa/subsampled_data/tfit_files/
out_dir=/Users/azofeifa/subsampled_data/mds_files/

#===============================================================
#Mouse Data ---comment out need be---



#===============================================================
#general parameters

log_out=/scratch/Shares/dowell/md_score_paper/log_files/mds/

for f in $(ls ${FILES}*_bidir_predictions.bed)
do

  bed=$f
  name=$(echo $bed | tr "/" "\n" | tail -1 | tr "-" "\n" | head -1  )    
  qsub -v DB=$DB,fasta=$fasta,bed=$bed,OUT=$out_dir,name=$name,log_out=$log_out $qsub_template -N $name
  
done







