#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=50G
#SBATCH --cpus-per-task=1
#SBATCH --job-name=tree
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic/tree_%j.out
#SBATCH --error=/data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic/tree_%j.err

WORKDIR=/data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic
COPIA=$WORKDIR/phylogenetic_analysis/copia_prot_align.fasta
GYPSY=$WORKDIR/phylogenetic_analysis/gypsy_prot_align.fasta
RESULTDIR=$WORKDIR/phylogenetic_analysis

module load FastTree/2.1.11-GCCcore-10.3.0
FastTree -out $RESULTDIR/tree_copia $COPIA 
FastTree -out $RESULTDIR/tree_gypsy $GYPSY 

