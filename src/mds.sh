#PBS -S /bin/bash

#PBS -N gTFIv2
#PBS -m ae
#PBS -M joseph.azofeifa@colorado.edu


#PBS -e /Users/azofeifa/qsub_stdo_errors/
#PBS -o /Users/azofeifa/qsub_stdo_errors/

#PBS -l walltime=72:00:00
#PBS -l nodes=1:ppn=64
#PBS -l mem=10gb

hostlist=$( cat $PBS_NODEFILE | sort | uniq | tr '\n' ',' | sed -e 's/,$//' )
# -- OpenMP environment variables --
OMP_NUM_THREADS=64
export OMP_NUM_THREADS
module load gcc_4.9.2
module load mpich_3.1.4






src=/scratch/Shares/dowell/md_score_paper/MDS/src/MDS
cmd="mpirun -np $PBS_NUM_NODES -hosts ${hostlist}"
$cmd $src EVAL -DB $DB -fasta $fasta -bed $bed -o $OUT -ID $name -log_out $log_out -pv 0.0000001 -H 1500

