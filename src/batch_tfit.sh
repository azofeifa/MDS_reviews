

qsub_template=/scratch/Shares/dowell/md_score_paper/useful_qsub_scripts/tfit.sh 
TSS=/scratch/Shares/dowell/md_score_paper/support_files/hg19_TSS.bed 
out_directory=/Users/azofeifa/subsampled_data/tfit_files/
tmp_log_directory=/scratch/Shares/dowell/md_score_paper/log_files/tfit/
FILES=/Users/azofeifa/subsampled_data/Hah2013/


BCT=0.1



for f in $(ls ${FILES}*)
do
  data=$f
  NAMEE=$(echo $data | tr "/" "\n" | tail -1 | tr "." "\n" | head -1  )
  qsub -v bg_file=$data,NAMEE=$NAMEE,bct=$BCT,out_directory=$out_directory,tmp_log_directory=$tmp_log_directory $qsub_template -N $NAMEE
  
done







