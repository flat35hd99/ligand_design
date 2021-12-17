#!/bin/sh -xe
#PBS -l select=1:ncpus=16:mpiprocs=1:ompthreads=1:jobtype=core
#PBS -l walltime=50:00:00

module load gaussian/g16/c01

set -xeu
source $HOME/flat/lov/ytva/dark/FMN/scripts/ims/env.sh

calculator=$SYSTEM_PREFIX/scripts/ims/calculator.sh

# Write calculation(s)
step1=B3LYP_dp_6
step2=B3LYP_dp_5

cd $SYSTEM_PREFIX
## Oxydized phosphoric acid
$calculator $SYSTEM_PREFIX/input/${step1}.gjf
$calculator $SYSTEM_PREFIX/input/${step2}.gjf $SYSTEM_PREFIX/output/${step1}/${SYSTEM_NAME}.chk
