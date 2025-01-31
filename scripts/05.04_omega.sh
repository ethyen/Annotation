#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=50G
#SBATCH --cpus-per-task=1
#SBATCH --job-name=clustalo
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic/clustalo_%j.out
#SBATCH --error=/data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic/clustalo_%j.err

WORKDIR=/data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic
COPIA=$WORKDIR/phylogenetic_analysis/Brassica_all_Copia.fasta
GYPSY=$WORKDIR/phylogenetic_analysis/Brassica_all_Gypsy.fasta
RESULTDIR=$WORKDIR/phylogenetic_analysis

module load Clustal-Omega/1.2.4-GCC-10.3.0
clustalo -i $COPIA -o $RESULTDIR/copia_prot_align.fasta --force
clustalo -i $GYPSY -o $RESULTDIR/gypsy_prot_align.fasta --force

