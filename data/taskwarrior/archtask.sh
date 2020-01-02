#!/bin/bash

export TASKDDATA=/var/lib/taskd

echo Change CN to hostname
sleep 2

sudo vim /usr/share/doc/taskd/pki/vars

cd /usr/share/doc/taskd/pki/

sudo ./generate

mkdir -p $TASKDDATA

cp *.pem $TASKDDATA

chown -R root /var/lib/taskd

sudo cp *pem $TASKDDATA

chown -R taskd:taskd $TASKDDATA

taskd config "$user".cert=/var/lib/taskd/client.cert.pem
taskd config "$user".key=/var/lib/taskd/client.key.pem
taskd config "$(hostname)".cert=/var/lib/taskd/server.cert.pem
taskd config "$(hostname)".key=/var/lib/taskd/server.key.pem
taskd config "$(hostname)".crl=/var/lib/taskd/server.crl.pem
taskd config ca.cert=/var/lib/taskd/ca.cert.pem

taskd config --force server $(hostname):53589

systemctl start taskd


echo name a group
read group

echo name user

read user

taskd add org $group

taskd add user $group $user

./generate.client $user

echo "
taskd.server=alfred:port
taskd.credentials=$group/$user/key
taskd.certificate=~/.task/'$user'.cert.pem
taskd.key=~/.task/'$user'.key.pem
taskd.ca=~/.task/ca.cert.pem" >> /var/lib/taskd/config

tar cf $user.tar "$user"* ca.cert.pem

