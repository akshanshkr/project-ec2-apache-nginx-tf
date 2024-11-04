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





# #!/bin/bash
# # Update the package list
# apt-get update -y

# # Install required packages for Certbot
# apt-get install -y software-properties-common

# # Add Certbot PPA and install Certbot for both Apache and Nginx
# add-apt-repository ppa:certbot/certbot -y
# apt-get update -y

# # Check the web_server variable and install the corresponding package with Certbot
# if [ "${web_server}" = "apache2" ]; then
#   # Install Apache2 and Certbot for Apache
#   apt-get install -y apache2 certbot python3-certbot-apache
#   systemctl start apache2
#   systemctl enable apache2
  
#   # Configure SSL with Certbot for Apache (Replace "example.com" with your domain)
#   certbot --apache -d example.aancconst.shop --non-interactive --agree-tos -m abc@gmail.com

# elif [ "${web_server}" = "nginx" ]; then
#   # Install Nginx and Certbot for Nginx
#   apt-get install -y nginx certbot python3-certbot-nginx
#   systemctl start nginx
#   systemctl enable nginx
  
#   # Configure SSL with Certbot for Nginx (Replace "example.com" with your domain)
#   certbot --nginx -d example.aanconst.shop --non-interactive --agree-tos -m abc@gmail.com

# else
#   echo "Unknown web server type: ${web_server}. Exiting."
#   exit 1
# fi

# # Schedule auto-renewal of certificates
# echo "0 0 * * * root certbot renew --quiet" | sudo tee -a /etc/crontab > /dev/null

