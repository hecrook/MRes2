#!/bin/sh
# Hannah Crook
# 09/05/2023
# Project: RSK4_trans
# Data type: RNA-Seq
# Notes: Run FastQC on raw sequencing files

# Array job!

#PBS -l select=1:ncpus=4:mem=2gb
#PBS -l walltime=12:0:0
#PBS -N FastQC-OHA-AmpliSeq
#PBS -J 1-15

module load anaconda3/personal

tmp=/rds/general/user/hec22/home/RSK4/analyses/temp

cd /rds/general/user/hec22/home/RSK4/analyses/data/folder/01.RawData

sample=`ls | tail -n $PBS_ARRAY_INDEX | head -1`
echo "Working with sample "$sample
cd $sample

#decompress files
gunzip *.gz

r1=`ls | grep _1.fq`
r2=`ls | grep _2.fq`

fastqc -t 4 $r1 -d $tmp
fastqc -t 4 $r2 -d $tmp