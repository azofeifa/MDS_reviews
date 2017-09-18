#PBS -S /bin/bash


#PBS -l walltime=36:00:00
#PBS -l nodes=1:ppn=1
#PBS -l mem=100gb

#PBS -m ae
#PBS -M joseph.azofeifa@colorado.edu

#PBS -e /Users/azofeifa/qsub_stdo_errors/
#PBS -o /Users/azofeifa/qsub_stdo_errors/

python /Users/azofeifa/MDS_reviews/src/subsample_bedgraph_file.py $IN $PER $OUT
