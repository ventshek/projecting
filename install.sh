#!/bin/bash

# Tuomas Eerola - 2019

if [ ! $# = 3 ]; then
  echo "Usage: $0 [-ud] gui_username gui_password"
  exit
fi

linux="$1"
username="$2"
password="$3"

if [ $linux = "-u" ] ; then
  echo '==== Your Linux: Ubuntu'
elif [ $linux = "-d" ] ; then
  echo '==== Your Linux: Debian'
else
  echo "Usage: $0 [-ud] gui_username gui_password"
  echo "Please use -u for Ubuntu, -d for Debian."
  exit
fi

echo '==== GUI username: ' $2
echo '==== GUI password: ' $3
echo ''

if [ $linux = "-u" ] ; then
  echo 'Now configuring your Ubuntu.'
  wget https://github.com/ventshek/projecting/edit/main/doinstall.sh
  sh doinstall.sh $username $password
  rm doinstall.sh
elif [ $linux = "-d" ] ; then
  echo 'Now configuring your Debian.'
  wget https://github.com/eerolat/setup-google-linux/raw/master/dodebian.sh
  sh dodebian.sh $username $password
  rm dodebian.sh
else
  echo 'Error. Can not start configuring your Linux.'
fi
