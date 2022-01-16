---
title: "users"
tags: [ "Documentation", "basics" ]
---
# Basic Information

Let's get some entries with 'getent', e.g. passwd or group.

> getent passwd

> getent group

Obviously:

> getent shadow

will require sudo.

## Examples

> sudo adduser maestro 

add user 'maestro'

This depends upon the settings in the /etc/default/useradd file and /etc/login.defs

> sudo useradd -m pinkie 

add user 'pinkie' with a home directory

> sudo adduser -m -e 2017-04-25 temp 

add expiry date to user

> userdel maestro 

delete maestro

> userdel -r maestro 

delete maestro and hir homefolder

> groups 

find which group you are in


> id 

same

> id -Gn maestro 

Find which groups maestro is in


> deluser --remove-home maestro 

delete user maestro


> usermod -aG sudo maestro 

add user maestro to group sudo


> cat /etc/passwd 

list users' passwords (and therefore users)

> groupadd awesome 

create the group 'awesome'

 passwords are stored in /etc/shadow.

 there are user accounts for processes such as 'bin' and 'nobody' which are locked, so they're unusable.

> passwd -l bin 

lock the user 'bin'

> more /etc/passwd | grep games 

we find the name, password and user id of the user 'games'. I.e. the password is 'x', and the user id is '5'.  The password is an impossible hash, so no input password could match.

> groupdel learners | delete the group 'learners'

> gpasswd -d pi games | remove user 'pi' from the group 'games'

> id games 

find the id number of group 'games' (60)

> usermod -aG sudo maestro 

add user to group 'maestro'

user info is stored in /etc's passwd, shadow, group and gshadow

# Defaults

The default new user profiles are under /etc/skel.

# Shells

A list of shells is in /etc/shells.

Only root can run shells not listed in /etc/shells

To change a user's shell:

usermod --shell /bin/bash user1

Alternatively, change the shell in /etc/passwd.

Usermod also lets you change a user's username:

> usermod -l henry mark

However, this will not change the home directory.

Lock a user out of an account:

usermod -L henry

# More Arguments

-G or -groups adds the user to other groups:

> usermod -G sudo henry

-s adds the user to a shell.

-u let's you manually specifiy a UID.

# Groups

In /etc/group, a group file may look like this:

`sudo:x:27:mike,steve`

We can use groupmod, like like usermod, e.g. to change a name:

> groupmod -n frontoffice backoffice

Delte a group:

> groupdel frontoffice

# Logins

See list of logged on users.

> w

See last logons:

> last

or all logon attempts, including bad attempts:

> lastb

List recently accessed files:

> last -d

See files opened by steve

> lsof -t -u steve

See files opened by anyone but steve

> lsof -u ^steve

Fuser can also track people loggingin:

> fuser /var/log/syslog

... and fuser can kill everything accessing the home directory:

> fuser -km /home

# Looking for Dodgy Files

Some files can be executed by people as if they had super user permissions, and that's okay... sometimes.

Let's start with files executable by user:

> sudo find / -type f -perm -g=s -ls

And then those executable by the group:

> find / -type f -perm -g=s -ls

And finally, worrying files, executable by anyone as if sie were the owner:

> find / -xdev \( -o -nogroup \) -print

Then have a look at resource usage per user.

#SGID

> sudo chmod u+s process.sh

This will modify process.sh to that instead of being simply executable, anyone executing it will have the permissions as if owner while executing it.

