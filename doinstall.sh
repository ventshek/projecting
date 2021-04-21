#!/bin/bash

# Tuomas Eerola - 2019

echo '==== This script will enable Graphical User Interface on your Ubuntu Server ===='
echo '==== and creates a user account that you can use with Remote Desktop Connections ===='
echo '==== Username: ' $1
echo '==== Password: ' $2
##
echo ''

echo '==== Upgrade system ===='
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y ufw
sudo ufw allow 25575
sudo ufw allow 25565
sudo ufw allow 80
sudo apt-get install -y openjdk-8-jre-headless
sudo apt-get install -y apache2 sqlite
sudo apt-get install -y php7.4 php7.4-sqlite php7.4-gd
sudo apt-get install -y openjdk-8-jdk
sudo apt-get install -y nano
#sudo nano /etc/apache2/apache2.conf
#under the <Directory /var/www/> section, change the AllowOverride value to all.
#sudo service apache2 reload
#wget --content-disposition http://www.multicraft.org/download/index?arch=linux64
#tar -xzf multicraft*.tar.gz
#cd multicraft/
#sudo ./setup.sh

# http://your.address/multicraft/install.php
#sudo /home/ventshek/multicraft/bin/multicraft start
#sudo rm /var/www/html/multicraft/install.php

#nano /etc/apache2/apache2.conf

echo '==== Install packages ===='
wget https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
mv server.jar minecraft_server_1.16.5.jar
wget https://github.com/ventshek/projecting/raw/main/eula.txt
wget https://github.com/ventshek/projecting/raw/main/server.properties
wget https://github.com/ventshek/projecting/raw/main/ops.json
java -Xms1024M -Xmx8G -jar minecraft_server_1.16.5.jar nogui
