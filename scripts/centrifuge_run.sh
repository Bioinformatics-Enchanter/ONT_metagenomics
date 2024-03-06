#!/bin/bash

#Script to do metagenomics analysis using "centrifuge tool"

#run centrifuge in input fasta file 
# Set the path to the centrifuge database

CENTRIFUGE_DB_PATH="/home/path/to/database/centrifuge-ref-db/p+h+v"

# Set path to fastq file

FASTQ_PATH="/home/Path/to/fastq/file.fq.gz"

# Run centrifuge on the input fastq file
centrifuge -x "$CENTRIFUGE_DB_PATH" \
-U "$FASTQ_PATH" \
-S centrifuge.report.txt \
--report-file ont.centrifuge.tsv \
-k 1 -p 16

#Kraken style report 
centrifuge-kreport -x "$CENTRIFUGE_DB_PATH" centrifuge.report.txt > kreport.tsv

### add header of kreport.

echo -e "%_clade_rooted_reads\tNo._reads_assign_to_root\tno.ofreads_assign_to_taxon\tRank\tTax_ID\tScientific_Name" > final_report.tsv

#Filter reads from kreport to final report

awk -F'\t' '$1 >= 0.1 && $3 >= 500 && $4 == "S"' kreport.tsv  >> final_report.tsv

# final report after filtering  %_clade_rooted_reads  greater than equals to 0.1 %
# no.ofreads_assign_to_taxon greater than eual to 500 
# Rank species(S) level 
# final output it save as final_report.tsv.



