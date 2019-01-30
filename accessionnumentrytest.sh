a#!/bin/bash

printf "Enter sample accession number followed by 'Enter'\n
NB. If the experiment time-dependant, enter them in the order in which they were sampled.\n
NB. If there are biological replicates, enter them in numerical order.\n
When finished press 'Ctrl+D': \n"

while read line
do
    anarr+=( $line )
done
printf -- '\n%s ' "Proceed analysis with the following accession numbers?

${anarr[@]}"

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