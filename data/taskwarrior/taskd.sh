#!/bin/bash

export TASKDDATA=/var/lib/taskd

sudo mkdir -p $TASKDDATA
sudo chown taskd:$(whoami) $TASKDDATA
sudo chmod 775 $TASKDDATA

cp -r /usr/share/doc/taskd/pki/ $TASKDDATA

cd $TASKDDATA/pki

sed -i s/localhost/$(hostname -f)/ vars

./generate

cp client.cert.pem $TASKDDATA
cp client.key.pem  $TASKDDATA
cp server.cert.pem $TASKDDATA
cp server.key.pem  $TASKDDATA
cp server.crl.pem  $TASKDDATA
cp ca.cert.pem     $TASKDDATA

taskd config --force client.cert $TASKDDATA/client.cert.pem
taskd config --force client.key  $TASKDDATA/client.key.pem
taskd config --force server.cert $TASKDDATA/server.cert.pem
taskd config --force server.key  $TASKDDATA/server.key.pem
taskd config --force server.crl  $TASKDDATA/server.crl.pem
taskd config --force ca.cert     $TASKDDATA/ca.cert.pem

cd $TASKDDATA/..
taskd config --force log $PWD/taskd.log
taskd config --force pid.file $PWD/taskd.pid
taskd config --force server $(hostname -f):53589

taskd add org public

# 1515de89-cc81-4af6-a6a4-41c1430620b0

journalctl -u taskd

