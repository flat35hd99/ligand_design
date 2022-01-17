#!/bin/bash

step_name=$1
charge=$2
multiplicity=$3
prefix=$SYSTEM_PREFIX/output/$step_name

module load amber/20/update9

mkdir $prefix/forcefield
gaussian_esp_file=$prefix/${SYSTEM_NAME}.esp
resp_file=$prefix/forcefield/${SYSTEM_NAME}_resp.mol2
prep_file=$prefix/forcefield/${SYSTEM_NAME}_resp.prep
frcmod_file=$prefix/forcefield/${SYSTEM_NAME}_resp.frcmod

cd $prefix/forcefield

echo "Convert gaussian output file into resp charge file(mol2)"
antechamber -i $gaussian_esp_file \
            -fi gesp \
            -o $resp_file \
            -fo mol2 \
            -c resp \
            -at gaff2 \
            -nc $charge \
            -m $multiplicity \
            -rn FMN \
            -pf y &> gesp_mol2.log

echo "Convert RESP charge file to prep file"
antechamber -i $resp_file \
            -fi mol2 \
            -o $prep_file \
            -fo prepi &> mol2_prep.log

echo "Convert prep file to frcmod file"
parmchk2 -i $prep_file \
         -f prepi \
         -o $frcmod_file \
         -s gaff2 &> mol2_gaff2.log

