#!/usr/bin/env bash
# from https://github.com/ojbc/docker/blob/master/java8-karaf3/files/git-download.sh
set -ex

if [ $# -ne 1 ]; then
    echo $0: usage: git-download.sh gitHubAPIURLToDownloadFrom
    echo $0: The API URL could be for example: https://api.github.com/repos/ojbc/main/contents/shared/ojb-certs
    exit 1
fi

dirs=$(curl -s $1 | grep html_url | grep -v gitignore | sed "s/.*\(https.*\)\".*/\1/g")

for dir in $dirs; do
	plain_dir=$(basename $dir)
	mkdir $plain_dir
	cd $plain_dir
	dir=$(echo $dir | sed "s/github\.com\//api.github.com\/repos\//g" | sed "s/tree/contents/g" | sed "s/master//g")
	files=$(curl -s $dir | grep download_url | sed "s/.*\(https.*\)\".*/\1/g")
	for f in $files
	do
		plainfile=$(basename $f)
		curl -s $f -o $plainfile
	done
	cd ..
done
