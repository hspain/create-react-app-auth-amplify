#!/bin/bash

# Number of files
file_nums=5
# The size of the each file in bytes
file_size=1500

# Creates the "files" directory if it doesn't exist
mkdir -p files

for i in {a..z}{a..z}; do
    # gets data from the /dev/urandom file and remove all unneeded characters
    # from it - all characters except "\t\n [:alnum:]".
    tr -dc "\t\n [:alnum:]" < /dev/urandom |
    # The "head" command takes specified amount of bytes and writes them to the 
    # needed file. 
    # The "files/${i}.ext" is the relative path to new files, which named 
    # like "aa.ext" and placed into the "files" directory
    head -c "$file_size" > "files/${i}.ext"

    # Iterations counter. It will stop "for" loop, when file_nums
    # will be equal to zero
    if !(( --file_nums )); then 
        break
    fi  
done
