#!/bin/bash

# NGINX HEALTH CHECKER
# Purpose: Check if NGINX is installed, running, and configured
NGINX_NAME="nginx"
CONFIG_FILE="/etc/nginx/nginx.conf"
ERROR_LOG="/var/log/nginx/error.log"
TEST_URL="http://localhost:80"
echo ""
echo "NGINX Health Check Report"
echo "$(date)"
echo ""
# 1. IS NGINX INSTALLED?
echo "[1] Checking if NGINX is installed..."

if which $NGINX_NAME; then
    echo "  NGINX is installed at $(which $NGINX_NAME)"
else
    echo "  NGINX is NOT installed"
    exit 1
fi
echo ""

# 2. IS NGINX RUNNING?
echo "[2] Checking if NGINX is running..."

if pgrep -x $NGINX_NAME > /dev/null; then
    echo "  NGINX is running (PID: $(pgrep -x $NGINX_NAME | head -1))"
else
    echo "  NGINX is NOT running"
fi
echo ""

# 3. DOES CONFIG FILE EXIST?
echo "[3] Checking if config file exists..."

if [ -f "$CONFIG_FILE" ]; then
    echo "  Config file found at $CONFIG_FILE"
else
    echo "  Config file NOT found at $CONFIG_FILE"
fi
echo ""

# 4. DOES ERROR LOG EXIST?
echo "[4] Checking if error log exists..."

if [ -f "$ERROR_LOG" ]; then
    echo "   Error log found at $ERROR_LOG"
    echo ""
    echo "  Last 2 error log entries:"
    tail -2 "$ERROR_LOG" 2>/dev/null | sed 's/^/    > /'
else
    echo "  Error log NOT found at $ERROR_LOG"
fi
echo ""

# 5. CHECK IMPORTANT DIRECTORIES
echo "[5] Checking important NGINX directories..."

for DIR in /etc/nginx /var/www/linux_project /var/log/nginx; do
    if [ -d "$DIR" ]; then
        echo "  $DIR exists"
    else
        echo "  $DIR is MISSING"
    fi
done
echo ""

# 6. TEST WEBSITE ON PORT 8080
echo " [6] Testing website on port 8080..."

if curl -s -o /dev/null -w "%{http_code}" $TEST_URL | grep -q "200"; then
    echo " Website is accessible on port 8080"
else
    echo " Website is NOT accessible on port 8080"
fi
echo ""

echo "SUMMARY"
echo ""
exit 0

