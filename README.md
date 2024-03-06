### ONT_metagenomics

This repositories is for using centrifuge tool for ONT bacterial data analysis.

#### Tools centrifuge version 1.0.4
-to install centrifuge 

```
git clone https://github.com/DaehwanKimLab/centrifuge
cd centrifuge 
make 
sudo make install prefix=/usr/local
```

Reference: https://github.com/DaehwanKimLab/centrifuge/tree/master

#### Database 

- to install database ("Bacteria + Archaea + Virues + Human ")

``curl -L -o p+h+v.tar.gz https://genome-idx.s3.amazonaws.com/centrifuge/p%2Bh%2Bv.tar.gz``

- after tar file install run following command,

``tar -xzvf p+h+v.tar.gz``

- remove tar file

`` rm -i p+h+v.tar.gz ``

- or use centrifuge indexes from <https://ccb.jhu.edu/software/centrifuge/manual.shtml> to install indexs 

#### Run centrifuge_run.sh script 

( before running below script make sure database are in "CENTRIFUGE_DB_PATH" and fastq file are in "FASTQ_PATH" or change path to database and input file as necessary inside script)


###### Set the path to the centrifuge database

CENTRIFUGE_DB_PATH="/home/path/to/database/centrifuge-ref-db/p+h+v"

###### Set path to fastq file

FASTQ_PATH="/home/Path/to/fastq/file.fq.gz"

-After changing path inside centrifuge_run.sh run following command.
-to run script run either 
`` ./path_to_script/centrifuge_run.sh ``
or
`` bash Path/to/script/centrifuge_run.sh

- centrifuge will  generate two file: "report.txt"" and "ont.centrifuge.tsv" 
- using centrifuge-kreport will generate kraken style report name: kreport.tsv. 
    -each column in kraken style report:  
    
    1) Percentage of fragments covered by the clade rooted at this taxon
    2) Number of fragments covered by the clade rooted at this taxon
    3) Number of fragments assigned directly to this taxon
    4) A rank code indicating (U)nclassified, (R)oot, (D)omain, (K)ingdom, (P)hylum, (C)lass, (O)rder, (F)amily,        (G)enus, (S)pecies. 
    5) The Taxonomic ID number from NCBI
    6) Indented Scientific Name
    
- in the script we have filtered species  based on following:
    
    - percent greater than equal to 0.1 % 
    - Number of fragments assigned directly to this taxon is greater than equal to 500. 
    - Rank indicating "(S)pecies"
    
    




