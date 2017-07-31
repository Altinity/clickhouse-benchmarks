#!/bin/bash

# download database

ZIP_FILES_DIR="zip"
mkdir "$ZIP_FILES_DIR"

if [ ! -d "$ZIP_FILES_DIR" ]; then
	"Can' use dir: $ZIP_FILES_DIR - not available"
	exit 1
fi

for year in `seq 1987 2017`; do
	for month in `seq 1 12`; do
		FILE_NAME="On_Time_On_Time_Performance_${year}_${month}.zip"
		wget -O "$ZIP_FILES_DIR/$FILE_NAME" "http://transtats.bts.gov/PREZIP/$FILE_NAME"
	done
done

