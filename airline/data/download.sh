#!/bin/bash

echo "Check required commands availability"
if command -v wget && command -v unzip && command -v clickhouse-client && command -v wc && command -v awk; then
	echo "Looks like all required commands are available"
else
	echo "Please ensure availability of: wget && unzip && clickhouse-client && wc && awk"
	exit 1
fi

# download database

ZIP_FILES_DIR="zip"
echo "Create dir $ZIP_FILES_DIR for downloading zip files"
mkdir "$ZIP_FILES_DIR"

if [ ! -d "$ZIP_FILES_DIR" ]; then
	"Can' use dir: $ZIP_FILES_DIR - not available"
	exit 1
fi

echo "Download files into $ZIP_FILES_DIR"
for year in `seq 1987 2017`; do
	for month in `seq 1 12`; do
		FILE_NAME="On_Time_On_Time_Performance_${year}_${month}.zip"
		wget -O "$ZIP_FILES_DIR/$FILE_NAME" "http://transtats.bts.gov/PREZIP/$FILE_NAME"
	done
done

