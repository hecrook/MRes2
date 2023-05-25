#!/bin/sh
# Hannah Crook
# 17/05/2023
# Project: RSK4_trans
# Data type: RNA-Seq
# Notes: Align fastq sequencing files

# Array job!

#PBS -l select=1:ncpus=16:mem=64gb
#PBS -l walltime=48:0:0
#PBS -N Align-fastq-RSK4
#PBS -J 1-18

module load anaconda3/personal
source activate RSK4

tmp=/rds/general/user/hec22/home/RSK4/analyses/temp
hg19_index=/rds/general/user/hec22/ephemeral/reference/hg19_index

cd /rds/general/user/hec22/home/RSK4/analyses/data/folder/01.RawData

sample=`ls | tail -n $PBS_ARRAY_INDEX | head -1`
echo "Working with sample "$sample
cd $sample

# Organising folders
mkdir -p "$sample"_fastQC
mv *_fastqc* "$sample"_fastQC/

#defining R1 and R2
R1=`ls | grep *_1.fq`
R2=`ls | grep *_2.fq`

#STAR mapping

# STAR --runThreadN 6 \
# --genomeDir $hg19_index \
# --readFilesIn $R1 [$R2] \
# --outFileNamePrefix "$sample"_mapped \
# --outSAMtype BAM SortedByCoordinate \

#1st try run on 23/03/2023

#Exited as it could not read in [R2], think this is because it does not need the brackets as R1 was read in fine and is in same directory
#Edited on 23/03/2023 to remove [] from --readFilesIn $R1 [$R2]

STAR --runThreadN 6 \
--genomeDir $hg19_index \
--readFilesIn $R1 $R2 \
--outFileNamePrefix "$sample"_mapped \
--outSAMtype BAM SortedByCoordinate \