#!/bin/sh -xe
#PBS -l select=1:ncpus=16:mpiprocs=1:ompthreads=1:jobtype=core
#PBS -l walltime=50:00:00

module load gaussian/g16/c01

set -xeu
source $HOME/flat/lov/ytva/dark/FMN/scripts/ims/env.sh

calculator=$SYSTEM_PREFIX/scripts/ims/calculator.sh
converter=$SYSTEM_PREFIX/scripts/ims/convert.sh

# Write calculation(s)
step1=HF_dp_3
step2=B3LYP_dp_10
step3=B3LYP_dp_11

cd $SYSTEM_PREFIX
$calculator $SYSTEM_PREFIX/input/${step1}.gjf
$calculator $SYSTEM_PREFIX/input/${step2}.gjf $SYSTEM_PREFIX/output/${step1}/${SYSTEM_NAME}.chk
$calculator $SYSTEM_PREFIX/input/${step3}.gjf $SYSTEM_PREFIX/output/${step2}/${SYSTEM_NAME}.chk

# Convert esp charge to resp charge, forcefield params
charge="-2"
multiplicity="3"
$converter $step3 $charge $multiplicity

