# LOG

## Gaussian Input Files

|gjf id|Name|Methods|Detail|
|---|---|---|---|
|0|raw_FMN.gjf|*|raw file that gaussview output|
|1|HF_dp_1.gjf|HF/6-31(d,p)|The first step to optimize structure.|
|2|B3LYP_dp_1.gjf|B3LYP/6-31(d,p) pop=(mk,saveesp)|The second step to optimize structure more acculately and obtain ESP charge in chk file|
|3|B3LYP_dp_2.gjf|B3LYP/6-31(d,p) iop=(6/42=6,6/50=1) pop=(mk)|The third step only to obtain ESP charge as a single file for antechamber|
