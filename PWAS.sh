#!/bin/bash

## 
code_dir=your/pathway/XWAS/code/fusion_twas-master
CHR=22
LD_dir=your/pathway/XWAS/code/fusion_twas-master/LDREF/1000G.EUR.


GWAS_FILE=your/pathway/brain_gut_MR_project/data/Disease/CJD/CJD_gwas_SMR_form_LDSC.sumstats.gz ###change

weights_pos=your/pathway/XWAS/WEIGHT/PWAS/blood/INTERVAL/PWAS_EA/Plasma_Protein_EA_hg19.pos ###change

weights_dir_path=your/pathway/XWAS/WEIGHT/PWAS/blood/INTERVAL/PWAS_EA/Plasma_Protein_weights_EA/ ###change

Weights_N=$weights_dir_path/Plasma_Protein_weights_EA ###change

N=$(ls -1 $Weights_N/ | wc -l) # 

out_dir=your/pathway/XWAS/outcome/CJD/PWAS/BLOOD/INTERVAL ###change

cd $out_dir
until [ $CHR -lt 1 ]
do
Rscript your/pathway/XWAS/code/PWAS/scripts/PWAS.assoc_test.R \
--sumstats $GWAS_FILE \
--weights $weights_pos \
--weights_dir $weights_dir_path \
--ref_ld_chr $LD_dir \
--chr ${CHR} \
--out $out_dir/chr_${CHR}.out 


