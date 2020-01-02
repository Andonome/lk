#!/bin/bash

[ ! -z $1 ] && sudo apt-get install -y virtualbox-guest-additions-iso

sudo apt-get -y install wget php php-{pear,cgi,common,curl,mbstring,gd,mysql,gettext,bcmath,imap,json,xml,fpm}

clear

echo 'The correct version of php should be 7.2.8 or greater.'

echo "The current version is $(php -v | grep PHP)"

sleep 5

sudo sh -c 'printf "upload_max_filesize = 20M\nmax_execution_time = 120\n" >> /etc/php.ini'

sudo apt-get install -y nginx

# Installing mariadb server

## uninstall any old versions first

## install software-properties-common if missing

sudo apt-get install -y software-properties-common

# then get the keys to the server

sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8

sudo add-apt-repository "deb [arch=amd64,arm64,ppc64el] http://mariadb.mirror.liquidtelecom.com/repo/10.4/ubuntu $(lsb_release -cs) main"

sudo apt -y update && sudo apt -y install mariadb-server mariadb-client

# Enter a password for the database, or if you did not get a prompt, run:


sudo mysql_secure_installation

# Then just accept defaults
