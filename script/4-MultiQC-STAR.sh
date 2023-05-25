#!/bin/sh
# Hannah Crook
# 23/05/2023
# Project: RSK4_trans
# Data type: RNA-Seq
# Notes: MultiQC on STAR log.out files


#PBS -l select=1:ncpus=2:mem=15gb
#PBS -l walltime=48:0:0
#PBS -N MultiQC-STAR-RSK4

module load anaconda3/personal
source activate oct_sWGS

cd /rds/general/user/hec22/home/RSK4/analyses/data/folder/01.RawData

multiqc . -o /rds/general/user/hec22/home/RSK4/analyses/data/MultiQC --filename MultiQC_STAR --ignore *_1_* --ignore *_2_*
