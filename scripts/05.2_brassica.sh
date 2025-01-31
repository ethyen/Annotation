#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=50G
#SBATCH --cpus-per-task=1
#SBATCH --job-name=brassica
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic/brassica_%j.out
#SBATCH --error=/data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic/brassica_%j.err

WORKDIR=/data/users/ediethelm/annotation/output/EDTA_annotation
BRASSICADB=/data/courses/assembly-annotation-course/CDS_annotation/data/Brassicaceae_repbase_all_march2019.fasta 

cd /data/users/ediethelm/annotation/output/EDTA_annotation/05_phylogenetic

apptainer exec --bind /data --writable-tmpfs -u /data/courses/assembly-annotation-course/CDS_annotation/containers/TEsorter_1.3.0.sif TEsorter $BRASSICADB -db rexdb-plant


