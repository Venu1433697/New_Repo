sudo chown -R nginx:nginx /usr/share/nginx/html/Vue-Crash-Public
sudo find /usr/share/nginx/html/Vue-Crash-Public -type d -exec chmod 755 {} \;
sudo find /usr/share/nginx/html/Vue-Crash-Public -type f -exec chmod 644 {} \;
sudo chmod +x /usr/share/nginx/html/Vue-Crash-Public/scripts/*.sh
