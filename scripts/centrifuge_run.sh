#!/bin/bash

#run centrifuge in input fasta file 
centrifuge -x centrifuge-ref-db/p_compressed \
-U data/combined_ont.fastq.gz \
-S report.txt \
--report-file ont.centrifuge.tsv \
- k 1 -p 16

#Kraken style report 
centrifuge-kreport -x centrifuge-ref-db/p_compressed report.txt > kreport.tsv


# awk -F'\t' '$1 >= 0.1 && $4 == "S"' kreport.tsv  > final_report.tsv
###
echo -e "%_clade_rooted_reads\tNo._reads_assign_to_root\tno.ofreads_assign_to_taxon\tRank\tTax_ID\tScientific_Name" > final_report.tsv

awk -F'\t' '$1 >= 0.1 && $3 >= 500 && $4 == "S"' kreport.tsv  >> final_report.tsv

## --host-taxids 1423,562,287,1639,1351,1280,28901,1613,210,2097,570278,12821766,1596,160 \