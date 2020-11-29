#!/bin/bash

# Assign location of transcriptome file
transcriptome=ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_35/gencode.v35.transcripts.fa.gz
genome=ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_35/GRCh38.primary_assembly.genome.fa.gz

# create a directory to store the transcriptome file
mkdir indexing

# Download human transcriptome and genome files 
wget -c $transcriptome -O indexing/gencode.v35.transcripts.fa.gz
wget -c $genome -O indexing/GRCh38.v35.genome.fa.gz
