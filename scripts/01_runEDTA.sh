#!/usr/bin/env bash

#SBATCH --cpus-per-task=20
#SBATCH --mem=64G
#SBATCH --time=3-00:00:00
#SBATCH --job-name=edta
#SBATCH --mail-user=etienne.diethelm@unifr.ch
#SBATCH --mail-type=end
#SBATCH --output=/data/users/ediethelm/annotation/output_edta_%j.o
#SBATCH --error=/data/users/ediethelm/annotation/error_edta_%j.e
#SBATCH --partition=pibu_el8


WORKDIR="/data/users/ediethelm/annotation"
FLYE="/data/users/okopp/assembly_annotation_course/assembly/flye/assembly.fasta"
#HIFIASM="/data/users/okopp/assembly_annotation_course/assembly/hifiasm/Kar-1.fa"
#LJA="/data/users/okopp/assembly_annotation_course/assembly/LJA/assembly.fasta"
OUTDIR="$WORKDIR/te_resultat_annotation"
mkdir -p $OUTDIR

# run EDTA on flye assembly

perl /data/users/ediethelm/annotation/output/EDTA_annotation/EDTA/EDTA.pl --genome $FLYE --species others --step all --cds "/data/courses/assembly-annotation-course/CDS_annotation/data/TAIR10_cds_20110103_representative_gene_model_updated" --anno 1 --threads 20