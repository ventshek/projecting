#!/bin/bash

# Tuomas Eerola - 2019

echo '==== This script will enable Graphical User Interface on your Ubuntu Server ===='
echo '==== and creates a user account that you can use with Remote Desktop Connections ===='
echo '==== Username: ' $1
echo '==== Password: ' $2

echo ''

echo '==== Upgrade system ===='
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo ufw allow 25565
sudo apt-get install -y xdotool
sudo apt-get install -y openjdk-8-jre-headless

echo '==== Install packages ===='
wget https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
mv server.jar minecraft_server_1.16.5.jar
java -Xms1024M -Xmx2048M -jar minecraft_server_1.16.5.jar nogui
rm eula.txt
cat > eula.txt
eula=true
xdotool key ctrl+d
java -Xms1024M -Xmx2048M -jar minecraft_server_1.16.5.jar nogui
