#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=50G
#SBATCH --cpus-per-task=1
#SBATCH --job-name=phylogenetic
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic/phylogenetic_%j.out
#SBATCH --error=/data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic/phylogenetic_%j.err

WORKDIR=/data/users/ediethelm/annotation/output/EDTA_annotation
BRASSICA=$WORKDIR/05_phylogenetic/Brassicaceae_repbase_all_march2019.fasta.rexdb-plant.dom.faa
RESULTDIR=$WORKDIR/05_phylogenetic/phylogenetic_analysis

LISTGG=$RESULTDIR/listGG.txt
LISTCC=$RESULTDIR/listCC.txt

module load SeqKit/2.6.1

grep Ty3-RT $BRASSICA > $LISTGG #make a list of RT proteins to extract
sed -i 's/>//' $LISTGG #remove ">" from the header
sed -i 's/ .\+//' $LISTGG #remove all characters following "empty space" from the header
seqkit grep -f $LISTGG $BRASSICA -o $RESULTDIR/Brassica_Ty3.fasta

grep Ty1-RT $BRASSICA > $LISTCC #make a list of RT proteins to extract
sed -i 's/>//' $LISTCC #remove ">" from the header
sed -i 's/ .\+//' $LISTCC #remove all characters following "empty space" from the header
seqkit grep -f $LISTCC $BRASSICA -o $RESULTDIR/Brassica_Ty1.fasta
