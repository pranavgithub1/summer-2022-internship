#!/bin/bash

if [ -z "$1" ]
  then
    echo "ERROR: Pass destination folder name as first argument"
    exit 1
fi

### Create Destination Folder
save_path=/home/pranav/vasp_out
octave_script=/home/pranav/octave_scripts/ExtractData_block.m

mkdir $save_path/$1
dest_folder=/home/pranav/vasp_out/$1
orig_folder=`pwd`
mkdir $dest_folder/matfiles
###

### Create Directory Structure and Rename Files to remove numbers

# Get largest number n in the folder
# ls | grep [0-9] | sed 's/[^0-9]\+//' | sort -n | tail -1
n=`ls | grep EIGE | sed 's/EIGE//' | sort -n | tail -1`
echo "creating $n folders under $dest_folder"
# loop through 1 .. n
for (( c=1; c<=$n; c++ ))
do
    printf "Processing block $c\r"
    # make dest_folder/1..n and copy contents
    mkdir $dest_folder/$c
    cur_dest=$dest_folder/$c
    args=`ls | grep [^0-9]$c$ | xargs`
    cp $args $cur_dest
    cp QuamboInput.m $cur_dest
    cp ORBCAR $cur_dest
    # rename copied files to remove numbers
    for i in $args
    do
        new_name=`echo $i | sed 's/[0-9]\+//'`
        mv $cur_dest/$i $cur_dest/$new_name
    done

    # run octave script ; cd into dest_folder/1..n then cd back
    cd $cur_dest
    octave $octave_script "$dest_folder/matfiles" $c &> "/dev/null"
    cd $orig_folder
done
