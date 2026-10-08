#!/usr/bin/env bash

File_Checker() {

read -p "Enter filename to check: " filename

if [ ! -f "$filename" ]; then
    echo "this file does not exist"
    exit 1
else
    echo "file $filename exists."
        if [ -r "$filename" ]; then
            echo "✓ file is readable"
        else
            echo "✗ file is not readable"
        fi

        if [ -w "$filename" ]; then
            echo "✓ file is writable"
        else   
            echo "✗ file is not writable"
        fi

        if [ -x "$filename" ]; then
            echo "✓ file is executable"
        else   
            echo "✗ file is not executable"
        fi
    
fi

}

File_Checker