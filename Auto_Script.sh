#!/bin/bash

# Create a subdirectory if it doesn't exist
log_directory="$HOME/logs"
mkdir -p "$log_directory"

# Generate the file name with current date and time in a shorter format
file_name="$log_directory/$(date +'%Y%m%d_%I%M_%p').log"

# Check if the script command is already running
if [ -z "$SCRIPT_RUNNING" ]; then
    # Start the script command and save the output to the generated file
    export SCRIPT_RUNNING=true
    script "$file_name"
    unset SCRIPT_RUNNING
fi

# Check if the log file exists and is not empty
if [ -s "$file_name" ]; then
    # Move the log file to the subdirectory if it's not already there
    if [ ! -e "$log_directory/$(basename "$file_name")" ]; then
        mv "$file_name" "$log_directory/"
    fi
fi

# Additional commands to run in the shell session
# For example:
# alias ll='ls -alF'
# export PATH="$HOME/bin:$PATH
