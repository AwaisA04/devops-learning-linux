#!/usr/bin/env bash

age=24
grade=23

if [ $age -ge 25 ]; then
    echo "you are elegible based on age"
    if [ $grade -ge 20 ]; then   
        echo "you are elegible based on grade"
        echo "WELL DONE you are elegible for a scholarship"
    else
        echo "sorry you are not elegible based on grade"
    fi

else 
    echo "sorry you are not elegible based on age"
fi
