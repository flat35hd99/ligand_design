#!/bin/bash
#PJM -L "rscunit=cl"
#PJM -L "rscgrp=cl-share"
#PJM -L "elapse=168:00:00"
#PJM -j
#PJM -S
#PJM -N "flavin_second_step"
#PJM --mail-list "flat35hd99@gmail.com"
#PJM -m e
#PJM "--norestart"

export MODULEPATH=/home/center/opt/x86_64/modulefiles_master/core:$MODULEPATH
module load gaussian16/c01
. $g16root/g16/bsd/g16.profile

set -xeu
source $(dirname $0)/env.sh

calculator=$(dirname $0)/calculator.sh

# Write calculation(s)
cd $SYSTEM_PREFIX
calculator input/first.gjk
calculator input/second.gjk output/${SYSTEM_NAME}.chk
