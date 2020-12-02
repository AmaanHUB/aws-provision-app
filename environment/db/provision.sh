#!/bin/bash

# Update and Upgrade
sudo apt update && sudo apt upgrade

# Install MongoDB, is not in default Ubuntu, cannot get the 3.2.20 version too
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt update
sudo apt install mongodb-org=3.2.20 -y

# Change the IP for MongoDB to 0.0.0.0
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

# Start the server and enable with the changes made
sudo systemctl enable mongod.service --now

