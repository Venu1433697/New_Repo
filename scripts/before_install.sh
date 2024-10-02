#!/bin/bash

# Stop the application if it's running
echo "Stopping the application..."
sudo systemctl stop httpd

# Backup existing application files
echo "Backing up existing files..."
sudo cp -r /var/www/html /var/www/html_backup_$(date +%F_%T)

# Clean up previous deployment files
echo "Cleaning up previous deployment files..."
sudo rm -rf /var/www/html/*

# Install dependencies if necessary
echo "Installing dependencies..."
cd /var/www/html
npm install

# Create required directories
echo "Creating required directories..."
sudo mkdir -p /var/www/html/uploads

# Update configuration files if necessary
echo "Updating configuration files..."
sudo cp /var/www/html/config.example.php /var/www/html/config.php

echo "Before install script completed successfully."
