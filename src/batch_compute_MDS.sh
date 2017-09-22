IN=$1
OUT=$2
END=1490
END2=3
qsub_template=/Users/azofeifa/MDS_reviews/src/compute_mds.sh

for ((i=1000;i< END;i+=5)); do
    echo $i
    qsub -v H=$i $qsub_template
done