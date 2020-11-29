## Generating Salmon Index Files with Decoys 

**Reference: https://combine-lab.github.io/alevin-tutorial/2019/selective-alignment**

### 0. Conda environment 

```yml
name: salmon
channels:
  - conda-forge
  - bioconda 
  - defaults 
dependencies:
  - salmon=1.4.0 
  - r-base =4.0.2
  - bedtools 
  - gawk 
  - r-tidyverse
  - r-data.table
  - r-ggplot2
  - r-markdown
  - r-upsetr
  - r-ggrepel
  - r-ggplotify
  - r-gridextra
  - r-pheatmap
  - bioconductor-deseq2
  - bioconductor-annotationhub
  - bioconductor-tximport
```



### 1. Downloading reference files

```bash
#!/bin/bash

# Assign location of transcriptome file
transcriptome=ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_35/gencode.v35.transcripts.fa.gz
genome=ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_35/GRCh38.primary_assembly.genome.fa.gz

# create a directory to store the transcriptome file
mkdir indexing

# Download human transcriptome and genome files 
wget -c $transcriptome -O indexing/gencode.v35.transcripts.fa.gz
wget -c $genome -O indexing/GRCh38.v35.genome.fa.gz

# Unzip the reference files manually!!!
```

### 2. Create a txt file storing decoys

```bash
#!/bin/bash

# Move to the indexing directory
cd indexing 

# Save reference names into decoys.txt
grep "^>" < *.genome.fa | cut -d " " -f 1 > decoys.txt

# Replace ">" to "" in the decoys.txt file
sed -i.bak -e 's/>//g' decoys.txt

cd .. 
```

### 3. Concatenate transcriptome and genome 

```bash

# Assign location of transcripts and genome reference files 
transcripts=indexing/*transcripts.fa 
genome=indexing/*genome.fa

# Concatenate them and save as.gentrome.fa
cat $transcripts $genome > gentrome.fa

```


### 4. Indexing 

```bash
#!/bin/bash

# Move to the directory where gentrome.fa and decoys.txt files have been created 
cd indexing

salmon index -t gentrome.fa -d decoys.txt -p 8 -i gencode_index --gencode

cd ..
```

