#!/bin/bash
#
# provision.sh
#
# Need to sort out the versioning of the software installed, but that can be done later

# newer versions of nodejs to shut the warnings down
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

sudo apt update && sudo apt upgrade -y

# array to show all the packages to be installed
ubuntu_packages=(nginx git nodejs)

# install all from array
sudo apt install $(echo ${ubuntu_packages[*]}) -y

# needs an if statement to not do this if already in .bashrc
# used for choosing the correct terminal in ssh and allow to do commands like clear
echo "export TERM='vt100'" >> ~/.bashrc
source ~/.bashrc

# Set up the reverse proxy with nginx
# Unlink this default config file
sudo unlink /etc/nginx/sites-enabled/default

# Copy made nginx file to the correct place
cd ~/aws-provision-app
sudo cp nginx/proxy_config.conf /etc/nginx/sites-available/proxy_config.conf

# Sort out the activation with this soft link, so on by default
# Don't link from the configs file just cause this location is where
# one would look for it
sudo ln -s /etc/nginx/sites-available/proxy_config.conf /etc/nginx/sites-enabled/proxy_config.conf

# Restart Nginx.service
sudo systemctl restart nginx.service

# Install pm2 with npm
sudo npm install pm2 -g

# Setting bash env
#echo "export DB_HOST='192.168.33.20'" >> ~/.bashrc

# update-env updates environment variables to be used by vagrant
cd ~/aws-provision-app/app/

pm2 start app.js --update-env
