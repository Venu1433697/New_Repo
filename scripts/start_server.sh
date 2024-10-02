#!/bin/bash

# Navigate to the application directory
cd /home/ec2-user/

# Install dependencies if needed (uncomment if necessary)
# npm install

# Start the application using pm2 or node
# Use pm2 to keep it running in the background
pm2 start app.js --name "my-app" --watch

# Alternatively, if you don't want to use pm2, you can use:
# node app.js &  # The '&' runs it in the background
