#!/bin/bash
# Update the package list
apt-get update -y

# Check the web_server variable and install the corresponding package
if [ "${web_server}" = "apache2" ]; then
  # Install Apache2
  apt-get install -y apache2
  systemctl start apache2
  systemctl enable apache2

  # Create Apache configuration for the domain
  cat <<EOF > /etc/apache2/sites-available/${domain_name}.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName ${domain_name}
    DocumentRoot /var/www/html
</VirtualHost>
EOF

  # Enable the site
  a2ensite ${domain_name}
  systemctl reload apache2

  # Install Certbot and obtain an SSL certificate
  apt-get install -y certbot python3-certbot-apache
  sleep 180  # Wait for DNS propagation (if needed)
  certbot --apache --non-interactive --agree-tos --email ak@gmail.com -d ${domain_name}

  # Create an SSL configuration for the domain
  cat <<EOF > /etc/apache2/sites-available/${domain_name}-ssl.conf
<VirtualHost *:443>
    ServerAdmin webmaster@localhost
    ServerName ${domain_name}
    DocumentRoot /var/www/html

    SSLEngine on
    SSLCertificateFile /etc/letsencrypt/live/${domain_name}/fullchain.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/${domain_name}/privkey.pem
</VirtualHost>
EOF

  # Enable the SSL site
  a2ensite ${domain_name}-ssl
  systemctl reload apache2

elif [ "${web_server}" = "nginx" ]; then
  # Install Nginx
  apt-get install -y nginx
  systemctl start nginx
  systemctl enable nginx

  # Create Nginx configuration for the domain
  cat <<EOF > /etc/nginx/sites-available/${domain_name}.conf
server {
    listen 80;
    server_name ${domain_name};

    location / {
        root /var/www/html;
        index index.html index.htm;
    }
}
EOF

  # Enable the site
  ln -s /etc/nginx/sites-available/${domain_name} /etc/nginx/sites-enabled/
  systemctl reload nginx

  # Install Certbot and obtain an SSL certificate
  apt-get install -y certbot python3-certbot-nginx
  sleep 180  
  certbot --nginx --non-interactive --agree-tos --email ak@gmail.com -d ${domain_name}

  # Create an SSL configuration for the domain
  cat <<EOF > /etc/nginx/sites-available/${domain_name}-ssl.conf
server {
    listen 443 ssl;
    server_name ${domain_name};

    ssl_certificate /etc/letsencrypt/live/${domain_name}/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/${domain_name}/privkey.pem;

    location / {
        root /var/www/html;
        index index.html index.htm;
    }
}
EOF

  # Enable the SSL site
  ln -s /etc/nginx/sites-available/${domain_name}-ssl.conf /etc/nginx/sites-enabled/
  systemctl reload nginx

else
  echo "Unknown web server type: ${web_server}. Exiting."
  exit 1
fi
