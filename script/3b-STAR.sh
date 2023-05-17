#!/bin/sh
# Hannah Crook
# 17/05/2023
# Project: RSK4_trans
# Data type: RNA-Seq
# Notes: Align fastq sequencing files

# Array job!

#PBS -l select=1:ncpus=4:mem=2gb
#PBS -l walltime=12:0:0
#PBS -N Align-fastq-RSK4
#PBS -J 1-15

tmp=/rds/general/user/hec22/home/RSK4/analyses/temp

cd /rds/general/user/hec22/home/RSK4/analyses/data/folder/01.RawData

sample=`ls | tail -n $PBS_ARRAY_INDEX | head -1`
echo "Working with sample "$sample
cd $sample

# Organising folders
mkdir -p "$sample"_fastQC
mv *_fastqc* "$sample"_fastQC/

module load anaconda3/personal
source activate RSK4
