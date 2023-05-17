#!/bin/sh
# Hannah Crook
# 17/05/2023
# Project: RSK4_trans
# Data type: RNA-Seq
# Notes: Align fastq sequencing files

#PBS -l select=1:ncpus=4:mem=2gb
#PBS -l walltime=12:0:0
#PBS -N Index-Reference-STAR-RSK4

module load anaconda3/personal
source activate RSK4

tmp=/rds/general/user/hec22/ephemeral/temp

cd /rds/general/user/hec22/ephemeral/reference



STAR --runThreadN 6 \
--runMode genomeGenerate \
--genomeDir /rds/general/user/hec22/ephemeral/reference/hg19_index \
--genomeFastaFiles /rds/general/user/hec22/ephemeral/reference/Homo_sapiens.GRCh37.dna.primary_assembly/Homo_sapiens.GRCh37.dna.primary_assembly.fa \
--sjdbGTFfile /rds/general/user/hec22/ephemeral/reference/Homo_sapiens.GRCh37.87.gtf/Homo_sapiens.GRCh37.87.gtf \
--sjdbOverhang 149