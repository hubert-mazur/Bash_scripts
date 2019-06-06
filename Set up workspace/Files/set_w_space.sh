#!/bin/bash
user_home_directory="/home/"`whoami`

#####################################################################################################################################################

Copy_CMakeLists ()
{
    cp ${user_home_directory}/Workspace_files/CMakeLists.txt ./$1
}

#####################################################################################################################################################

Change_access_permission ()
{
    chmod 700 $1
}

#####################################################################################################################################################

Copy_Main_file ()
{
amount_of_files_in_folder=`ls ${user_home_directory}/Pobrane | grep '.*.cpp' | awk 'BEGIN{suma=0}{suma++} END{print suma}'`
if [ $amount_of_files_in_folder -eq 0 ]
then 
echo "no cpp files!"
return
else
:
fi
for (( i=1; $i<=$amount_of_files_in_folder; i++)) ; do
name_of_file[$i]="`ls ${user_home_directory}/Pobrane | grep '.*.cpp' | awk "NR==$i"`"
time_since_UNIX_epoch[$i]=`date "+%s" -r ${user_home_directory}/Pobrane/${name_of_file[$i]}` 
done
last_date=${time_since_UNIX_epoch[1]}
last_index=1
for (( i=2; $i<=$amount_of_files_in_folder; i++)) ; do
if [[ ${last_date} -le ${time_since_UNIX_epoch[$i]} ]]
then
last_index=$i
last_date=${time_since_UNIX_epoch[$i]}
else
:
fi
done;
echo "The newest file I have found is: " ${name_of_file[1]}
if ((${time_since_UNIX_epoch[$last_index]}-`date "+%s"` + 86400 >= 0))  
then
echo "Copying..."
cp ${user_home_directory}/Pobrane/${name_of_file[$last_index]} $1
echo "Done!"
else
out_of_date=$(((-${time_since_UNIX_epoch[$last_index]} + `date "+%s"`)/86400)) 
echo "It appears that the newest file is quite outdated, exactly more than $out_of_date days, do you want to copy it anyway? [y/n]"
read choice
if [[ "$choice" == 'y' ]] || [[ "$choice" == 'Y' ]] || [[ "$choice" == 't' ]] || [[ "$choice" == 'T' ]]
then
echo "Copying..."
cp ${user_home_directory}/Pobrane/${name_of_file[$last_index]} $1
echo "Done!"
else
:
fi
fi
}

#####################################################################################################################################################

Create_dir () 
{
    if [ $# -eq 1 ]
    then
mkdir $1
mkdir ./$1/include
mkdir ./$1/sources
mkdir ./$1/Build
Copy_CMakeLists $1
Change_access_permission $1
Copy_Main_file $1
code .
else
if [ $# -eq 0 ]
then 
echo "type name of directory: "
read DIR_NAME
mkdir $DIR_NAME
mkdir ./$DIR_NAME/include
mkdir ./$DIR_NAME/sources
mkdir ./$DIR_NAME/Build
Copy_CMakeLists $DIR_NAME
Change_access_permission $DIR_NAME
Copy_Main_file $DIR_NAME
cd $DIR_NAME
code .
else
echo
fi
fi
}
if [ $# -eq 1 ]
then
Create_dir $1
else
Create_dir
fi

#####################################################################################################################################################
