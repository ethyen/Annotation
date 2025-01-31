#! /bin/bash
#!/usr/bin/env bash

#SBATCH --time=01:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=10
#SBATCH --job-name=OMArk_context
#SBATCH --partition=pibu_el8
#SBATCH --output=/data/users/ediethelm/annotation/OMArk_context_%j.out
#SBATCH --error=/data/users/ediethelm/annotation/OMArk_context_%j.err

COURSEDIR="/data/courses/assembly-annotation-course/CDS_annotation"

# had to install omadb and gffutils manually...

# Download the Orthologs of fragmented and missing genes from OMArk database
$COURSEDIR/softwares/OMArk-0.3.0/utils/omark_contextualize.py fragment -m /data/users/ediethelm/annotation/final_annotation/assembly.all.maker.proteins.fasta.renamed.filtered.fasta.omamer -o /data/users/ediethelm/annotation/omark_output -f fragment_HOGs
$COURSEDIR/softwares/OMArk-0.3.0/utils/omark_contextualize.py missing -m /data/users/ediethelm/annotation/final_annotation/assembly.all.maker.proteins.fasta.renamed.filtered.fasta.omamer -o /data/users/ediethelm/annotation/omark_output -f missing_HOGs 