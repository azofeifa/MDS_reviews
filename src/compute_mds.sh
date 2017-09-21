#PBS -S /bin/bash

#PBS -N gTFIv2
#PBS -m ae
#PBS -M joseph.azofeifa@colorado.edu


#PBS -e /Users/azofeifa/qsub_stdo_errors/
#PBS -o /Users/azofeifa/qsub_stdo_errors/

#PBS -l walltime=1:00:00
#PBS -l nodes=1:ppn=1

module load numpy_1.9.2
module load pandas_0.16.0

python /Users/azofeifa/MDS_reviews/src/compute_MDS.py $H
