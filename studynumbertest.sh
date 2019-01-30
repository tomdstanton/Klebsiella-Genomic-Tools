#!/bin/bash

printf "Enter the study accession number followed by 'Enter'\n
When finished press 'Ctrl+D': \n"

while read line
do
    studacc+=( $line )
done
printf -- '\n%s ' "Proceed analysis of all of the FASTQ files in this study?

${studacc[@]}"

read -r -p "

Are You Sure? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
 echo "Yes"
 ;;
 
    [nN][oO]|[nN])
 echo "No"
       ;;
 
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac

    #Study
        echo "The FASTQ files for the following study will be downloaded: ${studacc[@]}"
            wget https://www.ebi.ac.uk/ena/data/warehouse/filereport?accession=${studacc[@]}&result=read_run&fields=study_accession,sample_accession,secondary_sample_accession,experiment_accession,run_accession,tax_id,scientific_name,instrument_model,library_layout,fastq_ftp,fastq_galaxy,submitted_ftp,submitted_galaxy,sra_ftp,sra_galaxy,cram_index_ftp,cram_index_galaxy&download=txt
