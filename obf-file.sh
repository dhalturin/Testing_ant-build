#!/bin/bash

find project -name obf-list* -delete -o -name obf-files -delete

find project -type f -name *.pyco | while read file
do
    echo "${file} > $(md5sum ${file} | cut -f1 -d' ' | sed 's/ //')" >> $(dirname ${file})/obf-list
done

find project -type d -name scripts | while read d
do
    find $d -type f -name *.pyc | while read file
    do
        test -f $(dirname ${file})/obf-list || continue
        md5=$(md5sum ${file} | cut -f1 -d' ' | sed 's/ //')
        file_=$(echo ${file} | sed 's/\//\\\//g')

        sed -is "s/${md5}/${file_}/" $(dirname ${file})/obf-list
    done
done

find project -name obf-list -exec cat {} + > obf-files
find project -name obf-list -delete
