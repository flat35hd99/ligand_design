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
source /data/group1/z44550r/FMN/scripts/env.sh

calculator=$SYSTEM_PREFIX/scripts/calculator.sh

# Write calculation(s)
step1=first
step2=second

cd $SYSTEM_PREFIX
$calculator input/${step1}.gjk
$calculator input/${step2}.gjk output/${step1}/${SYSTEM_NAME}.chk

