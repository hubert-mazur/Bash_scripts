#!/bin/bash

#####################################################################################################################################################

amount_of_files_in_folder=`ls | grep  '.*.shp' | awk 'BEGIN{suma=0}{suma++} END{print suma}'`
if [ $amount_of_files_in_folder -eq 0 ]
then 
echo "no shp files!"
return
else
:
fi
for (( i=1; $i<=$amount_of_files_in_folder; i++)) ; do
name_of_file[$i]="`ls | grep '.*.shp' | awk "NR==$i"`"
done

for (( i=1; $i<=$amount_of_files_in_folder; i++)) ; do

    changed_name_of_file[$i]=$(echo ${name_of_file[$i]} | sed 's/.shp/.txt/g')
done

for (( i=1; $i<=$amount_of_files_in_folder; i++)) ; do
    #echo ${changed_name_of_file[$i]}

    touch ${changed_name_of_file[$i]}
    echo "UTF-8" > ${changed_name_of_file[$i]} 

done

