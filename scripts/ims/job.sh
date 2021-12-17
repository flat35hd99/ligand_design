#!/bin/sh -xe
#PBS -l select=1:ncpus=16:mpiprocs=1:ompthreads=1:jobtype=core
#PBS -l walltime=50:00:00

module load gaussian/g16/c01

set -xeu
source $HOME/flat/lov/ytva/dark/FMN/scripts/ims/env.sh

calculator=$SYSTEM_PREFIX/scripts/ims/calculator.sh

# Write calculation(s)
step1=HF_dp_1
step2=B3LYP_dp_1
step3=B3LYP_dp_2
step4=B3LYP_dp_3
re_step1=HF_dp_2
re_step2=B3LYP_dp_4
re_step3=B3LYP_dp_5
cd $SYSTEM_PREFIX
# $calculator $SYSTEM_PREFIX/input/${step1}.gjf
# $calculator $SYSTEM_PREFIX/input/${step2}.gjf $SYSTEM_PREFIX/output/${step1}/${SYSTEM_NAME}.chk
# $calculator $SYSTEM_PREFIX/input/${step3}.gjf $SYSTEM_PREFIX/output/${step2}/${SYSTEM_NAME}.chk
# $calculator $SYSTEM_PREFIX/input/${step4}.gjf $SYSTEM_PREFIX/output/${step2}/${SYSTEM_NAME}.chk
$calculator $SYSTEM_PREFIX/input/${re_step1}.gjf
$calculator $SYSTEM_PREFIX/input/${re_step2}.gjf $SYSTEM_PREFIX/output/${re_step1}/${SYSTEM_NAME}.chk
$calculator $SYSTEM_PREFIX/input/${re_step3}.gjf $SYSTEM_PREFIX/output/${re_step2}/${SYSTEM_NAME}.chk
