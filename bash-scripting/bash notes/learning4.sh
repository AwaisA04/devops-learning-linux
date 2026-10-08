#!/usr/bin/env bash

calculate_md5sum () {
    local file_path="$1"
    md5sum "$file_path"

}

calculate_md5sum "example.txt"