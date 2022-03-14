#!/bin/bash
#PJM -L "rscunit=cl"
#PJM -L "rscgrp=cl-share"
#PJM -L "elapse=168:00:00"
#PJM -j
#PJM -S
#PJM -N "FMN"
#PJM --mail-list "flat35hd99@gmail.com"
#PJM -m e
#PJM "--norestart"

export MODULEPATH=/home/center/opt/x86_64/modulefiles_master/core:$MODULEPATH
module load gaussian16/c01
. $g16root/g16/bsd/g16.profile

set -xeu
source $YTVA_DARK_PROTONATED_PREFIX/FMN/scripts/env.sh

calculator=$SYSTEM_PREFIX/scripts/calculator.sh

# Write calculation(s)
step1=HF_dp_2
step2=B3LYP_dp_4
step3=B3LYP_dp_5
cd $SYSTEM_PREFIX
$calculator $SYSTEM_PREFIX/input/${step1}.gjf
$calculator $SYSTEM_PREFIX/input/${step2}.gjf $SYSTEM_PREFIX/output/${step1}/${SYSTEM_NAME}.chk
$calculator $SYSTEM_PREFIX/input/${step3}.gjf $SYSTEM_PREFIX/output/${step2}/${SYSTEM_NAME}.chk
