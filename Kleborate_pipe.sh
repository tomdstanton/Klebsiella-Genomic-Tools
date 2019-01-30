#!/bin/bash
cd
# Enter file name of Sequences to analyse

    printf "

Enter file paths of FASTA sequences to be analysed.

When finished press 'Ctrl+D':
    
    "
        while read line
        do
            fasta4klebor8+=( $line )
        done
        printf -- '\n%s ' "The analysis will be performed on the following files:

    ${fasta4klebor8[@]}"
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

# Kleborate Script
    for i in "${fasta4klebor8[@]}";do
        prefix=( "$(basename "$i" )")
        kleborate --all \
        -o /home/tom/Bioinformatics/HvKp/Plasmids/${prefix::-6}/${prefix::-6}_Kleborate.txt \
        -a ${i}
    wait
    done