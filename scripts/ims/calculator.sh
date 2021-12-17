#!/bin/bash -eux

# Usage
# If you use check point file to restart:
# ./calculator.sh FMN.gjk FMN.chk
# 
# If you don't use check point file:
# ./calculator.sh FMN.gjk

gjk=$1
step_name=$(basename $gjk| sed 's/\.[^\.]*$//')
work_dir=$SYSTEM_PREFIX/output/$step_name
if [ ! -e $work_dir ]
then
  mkdir -p $work_dir
else
  echo "Working directory ${work_dir} exists. Terminated"
  exit 1
fi

cp $gjk $work_dir/$SYSTEM_NAME.gjk
if [ $# == 2 ];then
  chk=$2
  cp $chk $work_dir/
fi

export GAUSS_SCRDIR=$SYSTEM_PREFIX/scratch/$PBS_JOBID/$step_name
mkdir -p $GAUSS_SCRDIR

cd $work_dir
g16 < $SYSTEM_NAME.gjk > $step_name.log
