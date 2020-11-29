#!/bin/bash

# Move to the indexing directory
cd indexing 

# Save reference names into decoys.txt
grep "^>" < *.genome.fa | cut -d " " -f 1 > decoys.txt

# Replace ">" to "" in the decoys.txt file
sed -i.bak -e 's/>//g' decoys.txt

cd .. 
