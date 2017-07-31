#!/bin/bash

ZIP_FILES_DIR="zip"
CSV_FILES_DIR="csv"

rm -f "$CSV_FILES_DIR"/readme.html
rm -f "$CSV_FILES_DIR"/*.csv
rm -f "$ZIP_FILES_DIR"/*.zip

rmdir "$CSV_FILES_DIR"
rmdir "$ZIP_FILES_DIR"

