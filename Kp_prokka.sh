#!/bin/bash

#Enter file name of Sequences to annotate

    printf "

Enter file paths of FASTA sequences to be analysed.

When finished press 'Ctrl+D':
    
    "
        while read line
        do
            fasta4prokka+=( $line )
        done
        printf -- '\n%s ' "The annotation will be performed on the following files:

    ${fasta4prokka[@]}"

        read -r -p "

Are You Sure? [Y/n] 

" input
        
        case $input in
            [yY][eE][sS]|[yY])
        echo "Yes"
        ;;
        
            [nN][oO]|[nN])
        echo "No"
        exit 1
        ;;
        esac

    read -p "
    
    Enter path of the reference proteome:
    
    " reference

#Prokka Script
    for i in "${fasta4prokka[@]}"
    do
    prefix=( "$(basename "$i" )")
        prokka \
        --kingdom Bacteria --gcode 11 \
        --genus Klebsiella \
        --species pneumoniae \
        --plasmid ${prefix::-6} \
        --usegenus \
        --rfam \
        --addgenes \
        --proteins $reference \
        --prefix ${prefix::-6} \
        --metagenome \
        --outdir ${i::-6}_Prokka --force \
        $i
    wait
    done