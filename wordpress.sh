#!/bin/bash

# Function to prompt the user to open the website in a browser
function open_website() {
    echo "Your WordPress site is up and running."
    echo "Open http://Chinay.com in your browser to access it."
}

# Function to enable the site
function enable_site() {
    docker-compose up -d
    open_website
}

# Function to disable the site
function disable_site() {
    docker-compose down
    echo "The WordPress site has been disabled."
}

# Function to delete the site
function delete_site() {
    docker-compose down -v
    echo "The WordPress site has been deleted."
}

# Main script starts here
case "$1" in
    "enable")
        enable_site
        ;;
    "disable")
        disable_site
        ;;
    "delete")
        delete_site
        ;;
    *)
        echo "Usage: $0 {enable|disable|delete}"
        exit 1
        ;;
esac