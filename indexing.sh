#!/bin/bash

cd indexing
salmon index -t gentrome.fa -d decoys.txt -p 8 -i gencode_index --gencode
cd ..
