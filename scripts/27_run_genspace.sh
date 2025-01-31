#!/bin/bash

#SBATCH --time=01:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=25
#SBATCH --job-name=genespace
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/ediethelm/annotation/genespace_%j.out
#SBATCH --error=/data/users/ediethelm/annotation/genespace_%j.err

COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"
WORKDIR="/data/users/ediethelm/annotation"
GENESPACE=/data/users/ediethelm/annotation/genespace

apptainer exec --bind $COURSEDIR --bind "$WORKDIR" --bind "$SCRATCH:/temp" "$COURSEDIR/containers/genespace_latest.sif" Rscript "$WORKDIR/final_annotation/25_genspace.R" $GENESPACE 

