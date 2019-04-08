#! /usr/bin/bash

# extract first seq from fasta files

for i in *.fa

do
 awk '/^>/{if(N)exit;++N;} {print;}' $i >> onefasta_perOG.fa

done
