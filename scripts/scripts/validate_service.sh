#!/bin/bash

# Health check
URL="http://localhost:8080/health"

if curl --silent --fail "$URL" > /dev/null; then
  echo "Health check passed."
else
  echo "Health check failed."
  exit 1
fi

# Service status check
SERVICE_NAME="myapp.service"

if systemctl is-active --quiet "$SERVICE_NAME"; then
  echo "$SERVICE_NAME is running."
else
  echo "$SERVICE_NAME is not running."
  exit 1
fi

# Log checking
LOG_FILE="/var/log/myapp.log"

if grep -i "error" "$LOG_FILE"; then
  echo "Errors found in the log."
  exit 1
fi

echo "All validations passed."
exit 0
