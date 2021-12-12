#!/bin/bash -eux

source $(dirname $0)/env.sh

gjk=$1
step_name=$(basename $gjk| sed 's/\.[^\.]*$//')
work_dir=$SYSTEM_PREFIX/output/$step_name
mkdir -p $work_dir

cp $gjk $work_dir/$SYSTEM_NAME.gjk
if [ $# == 2 ];then
  chk=$2
  cp $chk $work_dir/
fi

cd $work_dir
g16 < $SYSTEM_NAME.gjk > $step_name.log
