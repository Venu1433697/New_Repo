#!/bin/bash

# Set the correct permissions
echo "Setting file permissions..."
chown -R webuser:webgroup /var/www/html/*
chmod -R 755 /var/www/html/*

# Update configuration files
echo "Updating configuration files..."
sed -i 's/OLD_VALUE/NEW_VALUE/' /var/www/html/config.php

# Run database migrations
echo "Running database migrations..."
cd /var/www/html && ./migrate.sh

# Clear application cache
echo "Clearing cache..."
rm -rf /var/www/html/cache/*

# Install dependencies (if needed)
echo "Installing dependencies..."
cd /var/www/html && npm install

# Run health checks
echo "Running health checks..."
curl -f http://localhost/health || exit 1

# Notify logging service
echo "Notifying logging service..."
curl -X POST -H "Content-Type: application/json" -d '{"message": "Deployment successful"}' http://logging-service/api/notify

echo "After install script completed successfully."
