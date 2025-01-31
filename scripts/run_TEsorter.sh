#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=10G
#SBATCH --cpus-per-task=8
#SBATCH --job-name=SeqKit
#SBATCH --mail-user=etienne.diethelm@unifr.ch
#SBATCH --mail-type=start,end
#SBATCH --partition=pibu_el8

FASTA_FILE=/data/users/ediethelm/annotation/output/EDTA_annotation/script/assembly.fasta.mod.EDTA.anno/assembly.fasta.mod.EDTA.TElib.fa
OUTDIR=/data/users/ediethelm/annotation/output/EDTA_annotation/3_TEsorter/results
WORKDIR=/data/users/ediethelm/annotation/

module load SeqKit/2.6.1

cd $OUTDIR

# Extract Copia sequences
seqkit grep -r -p "Copia" $FASTA_FILE > Copia_sequences.fa
# Extract Gypsy sequences
seqkit grep -r -p "Gypsy" $FASTA_FILE > Gypsy_sequences.fa

apptainer exec --bind /data --writable-tmpfs -u /data/courses/assembly-annotation-course/CDS_annotation/containers/TEsorter_1.3.0.sif TEsorter Copia_sequences.fa -db rexdb-plant
apptainer exec --bind /data --writable-tmpfs -u /data/courses/assembly-annotation-course/CDS_annotation/containers/TEsorter_1.3.0.sif TEsorter Gypsy_sequences.fa -db rexdb-plant