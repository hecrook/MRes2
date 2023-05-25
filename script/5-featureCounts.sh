#!/bin/sh
# Hannah Crook
# 25/05/2023
# Project: RSK4_trans
# Data type: RNA-Seq
# Notes: Read count with featureCounts (Rsub-read)

#PBS -l select=1:ncpus=6:mem=64gb
#PBS -l walltime=48:0:0
#PBS -N MultiQC-STAR-RSK4

module load anaconda3/personal 
source activate RSK4

cd /rds/general/user/hec22/home/RSK4/analyses/data/folder/01.RawData

gtf=/rds/general/user/hec22/ephemeral/reference/Homo_sapiens.GRCh37.87.gtf/Homo_sapiens.GRCh37.87.gtf
# STAR=_mappedAligned.sortedByCoord.out.bam
STAR=`find . -name "*.bam*"`

# featureCounts -T 6 -p --countReadPairs -a $gtf -t gene -g gene_id -o RSK4_counts.txt S1"$STAR", S11"$STAR", S13"$STAR", S15"$STAR", S3"$STAR", S4"$STAR", S6"$STAR", S7B"$STAR", S8B"$STAR", S10"$STAR", S12"$STAR", S14"$STAR", S2"$STAR", S3B"$STAR", S5"$STAR", S7"$STAR", S8"$STAR", S9"$STAR" --verbose
featureCounts -T 6 -p --countReadPairs -a $gtf -t gene -g gene_id -o RSK4_counts.txt ${STAR[@]}

