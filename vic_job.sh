#!/bin/sh
#SBATCH --job-name=vic_PHIGO_Iloilo45_15_node31
#SBATCH -o vic_test.out
#SBATCH -e vic_test.err
#SBATCH -n 16
##SBATCH -w node31
export MYAPP=/home/johsch/VIC/vic/drivers/image/vic_image.exe

export MPICH_PROCESS_GROUP=no
export I_MPI_FABRICS="shm:tmi"
export OMP_NUM_THREADS=1

# ---------------------------
# set up the mpich  and netcdf versions to use
# ---------------------------
# load the module
. /etc/profile.d/modules.sh
module purge
module load shared
module load openmpi/gcc/64/1.10.1
module load netcdf/gcc/64/4.4.1
# ---------------------------
# run the job
# ---------------------------
echo "Will run command: mpirun $MYAPP, using $SLURM_NTASKS cores"
mpirun $MYAPP -g /home/phigo/VIC/Iloilo/Run_85_15/run/PhigoDownscaled_Scenarios.txt


