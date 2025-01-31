#!/usr/bin/env bash

#SBATCH --cpus-per-task=2
#SBATCH --mem=64G
#SBATCH --time=3-00:00:00
#SBATCH --job-name=edta
#SBATCH --mail-user=etienne.diethelm@unifr.ch
#SBATCH --mail-type=end
#SBATCH --output=/data/users/ediethelm/annotation/output_edta_%j.o
#SBATCH --error=/data/users/ediethelm/annotation/error_edta_%j.e
#SBATCH --partition=pibu_el8
apptainer exec --bind /data /data/courses/assembly-annotation-course/CDS_annotation/containers/MAKER_3.01.03.sif maker -CTL
