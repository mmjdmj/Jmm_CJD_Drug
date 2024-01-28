#!/bin/bash

## 定义
code_dir=your/pathway/fusion_twas-master
CHR=22
LD_dir=your/pathway/fusion_twas-master/LDREF/1000G.EUR.


GWAS_FILE=your/pathway/CJD_gwas_SMR_form_LDSC.sumstats.gz ###change

weights_pos=your/pathway/XWAS/WEIGHT/EWAS/EWAS_weights/EWAS_weights.pos ###change

weights_dir_path=your/pathway/XWAS/WEIGHT/EWAS/EWAS_weights/EWAS_weights ###change

Weights_N=$weights_dir_path/EWAS_weights  ###change

N=$(ls -1 $Weights_N/ | wc -l) # 

out_dir=your/pathway/XWAS/outcome/CJD/EWAS ###change


cd $out_dir
until [ $CHR -lt 1 ]
do
Rscript your/pathway/XWAS/code/EWAS-fusion/files/fusion_twas/FUSION.assoc_test.R \
--sumstats $GWAS_FILE \
--weights $weights_pos \
--weights_dir $weights_dir_path \
--ref_ld_chr $LD_dir \
--chr ${CHR} \
--out $out_dir/chr_${CHR}.out 


