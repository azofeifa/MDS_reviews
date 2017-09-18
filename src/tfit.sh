#PBS -S /bin/bash


#PBS -l walltime=36:00:00
#PBS -l nodes=1:ppn=64
#PBS -l mem=100gb

#PBS -m ae
#PBS -M joseph.azofeifa@colorado.edu

#PBS -e /Users/azofeifa/qsub_stdo_errors/
#PBS -o /Users/azofeifa/qsub_stdo_errors/

hostlist=$( cat $PBS_NODEFILE | sort | uniq | tr '\n' ',' | sed -e 's/,$//' )
# -- OpenMP environment variables --
OMP_NUM_THREADS=64
export OMP_NUM_THREADS
module load gcc_4.9.2
module load mpich_3.1.4



#================================================================
#paths to config and src
src=/scratch/Shares/dowell/md_score_paper/Tfit/src/Tfit
src=/Users/azofeifa/Tfit/src/Tfit
config_file=/scratch/Shares/dowell/md_score_paper/support_files/config_file.txt


#================================================================
#calling command
cmd="mpirun -np $PBS_NUM_NODES -hosts ${hostlist}"


$cmd $src bidir -config $config_file -ij $bg_file  -tss $TSS -bct $bct  -o $out_directory -log_out $tmp_log_directory -N $NAMEE
#================================================================