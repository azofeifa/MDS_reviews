IN=$1
OUT=$2
END=1000
END2=3
qsub_template=/Users/azofeifa/MDS_reviews/src/compute_mds.sh
for ((i=10;i< END;i+=5)); do
    qsub -v H=$i $qsub_template -N subsampling_$i_$j
done