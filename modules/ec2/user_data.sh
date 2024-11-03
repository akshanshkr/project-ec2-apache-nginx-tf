#!/bin/bash
# Update the package list
apt-get update -y

# Check the web_server variable and install the corresponding package
if [ "${web_server}" = "apache2" ]; then
  # Install Apache2
  apt-get install -y apache2
  systemctl start apache2
  systemctl enable apache2
elif [ "${web_server}" = "nginx" ]; then
  # Install Nginx
  apt-get install -y nginx
  systemctl start nginx
  systemctl enable nginx
else
  echo "Unknown web server type: ${web_server}. Exiting."
  exit 1
fi
