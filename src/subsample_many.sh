IN=$1
OUT=$2
END=100
END2=3
qsub_template=/Users/azofeifa/MDS_reviews/src/subsample_qsub.sh
for ((i=5;i< END;i+=5)); do
    for ((j=1;j<=END2;j+=1)); do
	ID=${OUT}_${i}_${j}
	qsub -v IN=$IN,OUT=$ID,PER=$i $qsub_template -N subsampling_$i_$j
    done
done