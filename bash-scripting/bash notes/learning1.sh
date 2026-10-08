#!/usr/bin/env bash

write_files(){
    local file_path="$1"
    local data="$2"

    echo "$data" > "$file_path"



}

write_files "read.txt" "hi"


 