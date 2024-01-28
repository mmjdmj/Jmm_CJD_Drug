#!/bin/bash


code_dir=your/pathway/XWAS/code/fusion_twas-master
CHR=22
LD_dir=your/pathway/XWAS/code/fusion_twas-master/LDREF/1000G.EUR.


GWAS_FILE=your/pathway/brain_gut_MR_project/data/Disease/CJD/CJD_gwas_SMR_form_LDSC.sumstats.gz ###change

weights_pos=your/pathway/XWAS/WEIGHT/TWAS/GTEx_v8/EUR_Samples/GTExv8.EUR.Brain_Spinal_cord_cervical_c-1/GTExv8.EUR.Brain_Spinal_cord_cervical_c-1.nofilter.pos ###change

weights_dir_path=your/pathway/XWAS/WEIGHT/TWAS/GTEx_v8/EUR_Samples/GTExv8.EUR.Brain_Spinal_cord_cervical_c-1/ ###change

Weights_N=$weights_dir_path/GTExv8.EUR.Brain_Spinal_cord_cervical_c-1 ###change

N=$(ls -1 $Weights_N/ | wc -l) 

out_dir=your/pathway/XWAS/outcome/CJD/TWAS/BRAIN/GTEx/Brain_Spinal_cord_cervical_c-1 ###change


cd $out_dir
until [ $CHR -lt 1 ]
do
Rscript $code_dir/FUSION.assoc_test.R \
--sumstats $GWAS_FILE \
--weights $weights_pos \
--weights_dir $weights_dir_path \
--ref_ld_chr $LD_dir \
--chr ${CHR} \
--out $out_dir/chr_${CHR}.out 


