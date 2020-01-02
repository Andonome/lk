Switch to root to make things easier.

> yay -S

> export TASKDDATA=/var/lib/taskd

Edit `/usr/share/doc/taskd/pki/vars` so that ``CN'' = the hostname (IP is fine).

> cd /usr/share/doc/taskd/pki

Execute the `generate` file to generate a selfsigned certificate for the server.  These will be \*.pem-files.  Copy all \*.pem-files to /var/lib/taskd.

Make sure a copy of ca.cert.pem remains to generate user-certificates later.

# Taskd Configurations

> taskd config --force client.cert $TASKDDATA/client.cert.pem

> taskd config --force client.key $TASKDDATA/client.key.pem

> taskd config --force server.cert $TASKDDATA/server.cert.pem

> taskd config --force server.key $TASKDDATA/server.key.pem

> taskd config --force server.crl $TASKDDATA/server.crl.pem

> taskd config --force ca.cert $TASKDDATA/ca.cert.pem

# Change Taskd Log Location
The default is /tmp/log, which obviously you don't want.

> touch /var/log/taskd.log

> chown taskd:taskd /var/log/taskd.log

> taskd config --force log /var/log/taskd.log

Finally, set up the servername - the same one as in the certificates.  Mine is ``testarch''.

> taskd config --force server testarch:9001

# Adding users
Let's add the group ``home'', then the user ``ghost'', will go in that group.

> taskd add org home

> taskd add user home ghost

`3f9e6154-25cb-4e45-88bb-45e98feef904`

> taskd add user home alfred

`4fbb319c-c493-437a-ab7a-028f5b75e522`

The user then gets a key.

Finally, make sure that taskd can read its own data>

> chown -R taskd:taskd /var/lib/taskd/orgs

... or perhaps the entire directory of /var/lib/taskd/.

Then it's back to /usr/share/doc/taskd/pki 

Generate some userfiles:

> ./generate.client ghost

> ./generate.client alfred

The bob and ghost \*pem files have to be added to the given users' home directories.

# Setting up Users

> sudo apt-get install taskwarrior taskd

> task

Then move the \*pem files into the .task directory of the user.

Don't forget to add the ca.key.pem from `/usr/share/doc/taskd/pki`!

# Attempt 2

Well, none of that worked.

New info from [taskwarrior](https://gitpitch.com/GothenburgBitFactory/taskserver-setup#/1/4)

Default port = 53589

starting with

> taskd init

> taskd config server localhost:53589

View supported settings with `taskdrc`.

!!! Start with taskdctl start

Do a non-daemon version with 

> taskd server --data $TASKDDATA --daemon

# Systemd Unit file

This needs to be edited for "$TASKDDATA", "$TASKDUSER", and "$TASKDGROUP".


---
Unit]
Description=Secure server providing multi-user, multi-client access to Taskwarrior data
Requires=network.target
After=network.target
Documentation=http://taskwarrior.org/docs/#taskd
 
[Service]
ExecStart=/usr/local/bin/taskd server --data $TASKDDATA
Type=simple
User=$TASKDUSER
Group=$TASKDGROUP
WorkingDirectory=$TASKDDATA
PrivateTmp=true
InaccessibleDirectories=/home /root /boot /opt /mnt /media
ReadOnlyDirectories=/etc /usr
 
[Install]
WantedBy=multi-user.target

---

Enable all this by copying the file to `/etc/systemd/system`, reload daemon, then start it.

Key for ghost:
29bd8a06-2cc0-4163-905d-6216257a3031

e29bffe0-72d8-45f2-b1f9-f29397cfab16

# Different:

$ task config taskd.certificate -- ~/.task/first_last.cert.pem
$ task config taskd.key         -- ~/.task/first_last.key.pem
$ task config taskd.ca          -- ~/.task/ca.cert.pem

# Trust

For troubleshooting we can set:

> taskd.trust=ignore [hostname]

> taskd.trust=allow all

> taskd.trust=strict

# User Defines Attributes - UDA

Each UDA has two to four attributes: type (numeric or string) and label are necessary:

> task config uda.THING.type {numeric,string}

> task config uda.THING.label Thg

Constrain these attributes to a comma-delineated set with:

> task config uda.THING.values brown,orange,green

You can also show how important the Attribute makes something:

> urgency.uda.THING.coefficient=2.8

# Aliases

Alias `delete' to `rm' with:

task config alias.rm delete



