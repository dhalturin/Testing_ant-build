#!/bin/bash

if [ -z "${1}" ]; then
    dir=project;
else
    if [ -d "project/${1}" ]; then
        dir=project/${1}
    else
        echo "Don't find directory 'project/${1}'"
        exit 1
    fi
fi

find ${dir} -name obf-list* -delete -o -name obf-files -delete

find ${dir} -type f -name *.pyco | while read file
do
    echo "${file} > $(md5sum ${file} | cut -f1 -d' ' | sed 's/ //')" >> $(dirname ${file})/obf-list
done

find ${dir} -type d -name scripts | while read d
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
