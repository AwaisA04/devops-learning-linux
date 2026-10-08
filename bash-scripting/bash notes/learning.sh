#!/usr/bin/env bash

greet_usr() {
    echo "whats your name?"
    read name
    echo "hello $name"
}

greet_usr