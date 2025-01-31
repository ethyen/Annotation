#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=50G
#SBATCH --cpus-per-task=1
#SBATCH --job-name=phylogenetic
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic/phylogenetic_%j.out
#SBATCH --error=/data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic/phylogenetic_%j.err

WORKDIR=/data/users/ediethelm/annotation/output/EDTA_annotation
COPIA=$WORKDIR/3_TEsorter/results/Copia_sequences.fa.rexdb-plant.dom.faa
GYPSY=$WORKDIR/3_TEsorter/results/Gypsy_sequences.fa.rexdb-plant.dom.faa
RESULTDIR=$WORKDIR/05_phylogenetic/phylogenetic_analysis

LISTG=$RESULTDIR/listG.txt
LISTA=$RESULTDIR/listC.txt

module load SeqKit/2.6.1

grep Ty3-RT $GYPSY > $LISTG #make a list of RT proteins to extract
sed -i 's/>//' $LISTG #remove ">" from the header
sed -i 's/ .\+//' $LISTG #remove all characters following "empty space" from the header
seqkit grep -f $LISTG $GYPSY -o $RESULTDIR/Gypsy_RT.fasta

grep Ty1-RT $COPIA > $LISTA #make a list of RT proteins to extract
sed -i 's/>//' $LISTA #remove ">" from the header
sed -i 's/ .\+//' $LISTA #remove all characters following "empty space" from the header
seqkit grep -f $LISTA $COPIA -o $RESULTDIR/Copia_RT.fasta
3