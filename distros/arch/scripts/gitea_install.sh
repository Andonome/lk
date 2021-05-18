#!/bin/sh
pacman -S gitea postgresql
sudo su postgres -c 'initdb -D /var/lib/postgres/data'
sudo systemctl start postgresql
sudo su postgres -c 'createuser -P gitea'
sudo su postgres -c 'createdb -O gitea gitea'
sudo sed -i 's/mysql/postgres/' /etc/gitea/app.ini
sudo sed -i 's/root/gitea/' /etc/gitea/app.ini
sudo systemctl start gitea
