# Log

## Gaussian Input Files

|gjf id|Name|Methods|Detail|
|---|---|---|---|
|0|raw_FMN.gjf|*|raw file that gaussview output|
|1|HF_dp_1.gjf|HF/6-31(d,p)|The first step to optimize structure.|
|2|B3LYP_dp_1.gjf|B3LYP/6-31(d,p) pop=(mk,saveesp)|The second step to optimize structure more acculately and obtain ESP charge in chk file|
|3|B3LYP_dp_2.gjf|B3LYP/6-31(d,p) iop=(6/42=6,6/50=1) pop=(mk)|The third step only to obtain ESP charge as a single file for antechamber|
|4|B3LYP_dp_3.gjf|b3lyp/6-31g(d,p) pop=(nbo,savenbo)|The forth step only to obtain bond order|
|5|HF_dp_2.gjf|opt HF/6-31g(d,p)|Recalculation by adding two hydrogens to oxygens of phosphoric acid group|
|6|B3LYP_dp_4.gjf|opt b3lyp/6-31g(d,p) pop=(mk,saveesp)||
|7|B3LYP_dp_5.gjf|b3lyp/6-31g(d,p) pop=mk iop(6/42=6,6/50=1)||
|8|B3LYP_dp_6.gjf|opt B3LYP/6-31g(d,p) pop=(mk,saveesp)|Use only B3LYP, without HF|
|9|B3LYP_dp_7.gjf||Copy of B3LYP_dp_5.gjf|
|10|B3LYP_dp_8.gjf||Run ag_smith way|
|11|B3LYP_dp_9.gjf||Run ag_smith way|

## Process

### Oxydized phosphoric acid

1. Pick up FMN coordinates from [2PR5.pdb](https://www.rcsb.org/structure/2PR5) and save as `FMN.pdb`.
2. Input `FMN.pdb` to gaussview 6.0.16 and create gjf file that is gjf id 0, `raw_FMN.gjf` file.
3. Copy `raw_FMN.gjf` to `HF_dp_1.gjf` and modify it. gjf id is 1. 
4. Copy `HF_dp_1.gjf` to `B3LYP_dp_1.gjf` and remove all coodinates. gjf id is 2.
5. Copy `B3LYP_dp_1.gjf` to `B3LYP_dp_2.gjf` and modify header and add file name in the bottom of file. gjf id is 3.
6. Run `Gaussian 16:  ES64L-G16RevC.01` using `scripts/job.sh`
7. Add `B3LYP_dp_3.gjf` to calculate bond order. Modify `scripts/job.sh` and run.

### Reduced phosphoric acid

These jobs were preformed in IMS. 

1. Using `Oxydized phosphoric acid` step1 `FMN.pdb`, Add two hydrogens to phosphoric acid group. Obtain `raw_FMN_added_hydrogen.gjf`.

![](img/added_hydrogen.png)

2. Copy `raw_FMN_added_hydrogen.gjf` to `HF_dp_2.gjf` and modify. The modification is same as `HF_dp_1.gjf`.
3. Do same processes of `B3LYP_dp_1.gjf` and `B3LYP_dp_2.gjf` and save them as `B3LYP_dp_4.gjf` and `B3LYP_dp_5.gjf`, respectively.
4. Run.

### Use B3LYP in entire job.

1. Copy `HF_dp_2.gjf` as `B3LYP_dp_6.gjf`, change method(HF -> B3LYP), and add `pop=(mk,saveesp)`
2. Run `B3LYP_dp_6.gjf` and `B3LYP_dp_5.gjf` to obtain ESP charge as a separated file.

### Others

# ws_FMN.e5635795
B3LYP_dp_7(use B3LYP_dp_6)

#### ws_FMN.e5635837
HF_d_1
B3LYP_d_1
B3LYP_d_2

#### ws_FMN.e5635848
HF_d_2
B3LYP_d_3
B3LYP_d_4

#### ws_FMN_spin.e5637546
HF_dp_3
B3LYP_dp_10
B3LYP_dp_11

### Generate AMBER input files term

After calculating structure and esp charge, we perform processes:

1. Get mol2 file and parmod file. mol2 file contain ligand structure and esp charge. parmod file contain force filed parameters without statistical electricity calculated by energy surface.( statistical electricity information is described by esp charge. parmod file does not describe it.( at least in this project )
2. Get prmtop file(parameter and topology) and rst file(restart file)

I mistaken a lot but I did not record it. :(

Fortunately, the key is simple. I write success way and the reason why the process was needed.

### 
