#!/usr/bin/env bash

file_operations_script() {
    mkdir -p bash_demo
    cd bash_demo

    local file="$1"
    local input="$2"

    echo "$input $(date +"%Y-%m-%d")" > "$file"
    echo "Directory 'bash_demo' created. File '$file' created."

    echo "File contents:"
    cat "$file"
}

file_operations_script "demo.txt" "This file was created by a Bash script on"