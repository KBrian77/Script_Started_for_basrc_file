#!/bin/bash
echo
# Prompt user to create PWA files and directories
read -p "Do you want to create all the files and directories for a new PWA? (y for yes or n for no): " answer
echo
# Convert answer to lowercase
answer="${answer,,}"

# Check if user wants to create PWA
if [ "$answer" == "y" ]; then
    # Prompt user for directory name
    echo
    read -p "Enter directory name for your PWA (press Enter for default 'my_pwa'): " directory_name

    # Use default name if no input provided
    directory_name="${directory_name:-my_pwa}"

    # Create directory structure
    mkdir -p "$directory_name"/static/{css,js}
    mkdir -p "$directory_name"/templates

    # Create HTML file in templates directory
    touch "$directory_name"/templates/index.html

    # Create CSS file
    touch "$directory_name"/static/css/styles.css

    # Create JavaScript file
    touch "$directory_name"/static/js/app.js

    # Create server Python file
    touch "$directory_name"/server.py

    echo "PWA directory and files created successfully in '$directory_name'!"

    # List directory and file names
    echo "Directories created:"
    ls -d "$directory_name"/*/

    echo "Files created:"
    ls "$directory_name"/*
elif [ "$answer" == "n" ]; then
    echo "Exiting script. No files or directories were created."
else
    echo "Invalid input. Please enter y or n."
fi
