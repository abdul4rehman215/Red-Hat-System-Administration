#!/bin/bash

# Demonstrating variable scope in Bash

global_var="I'm global"

function demo() {
    local local_var="I'm local"
    echo "Inside function: $global_var, $local_var"
}

demo

echo "Outside: $global_var"
echo "Local outside: $local_var"
