#!/bin/sh
# Hannah Crook
# 09/05/2023
# Project: RSK4_trans
# Data type: RNA-Seq
# Notes: Run MultiQC on FastQC files

#PBS -l select=1:ncpus=1:mem=2gb
#PBS -l walltime=12:0:0
#PBS -N MultiQC-RSK4


module load anaconda3/personal
source activate oct_sWGS

tmp=/rds/general/user/hec22/home/RSK4/analyses/temp

cd /rds/general/user/hec22/home/RSK4/analyses/data/folder/01.RawData

multiqc . -o /rds/general/user/hec22/home/RSK4/analyses/data/MultiQC --filename MultiQC_All

