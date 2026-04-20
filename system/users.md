---
title: "users"
tags: [ "basics" ]
---
# Basic Information

Let's get some entries with 'getent', e.g. passwd or group.

```sh
getent passwd
```

```sh
getent group
```

Obviously:

```sh
getent shadow
```

## Examples

```sh
sudo adduser maestro 
```

add user 'maestro'

This depends upon the settings in the /etc/default/useradd file and /etc/login.defs

```sh
sudo useradd -m pinkie 
```

add user 'pinkie' with a home directory

```sh
sudo adduser -m -e 2017-04-25 temp 
```

add expiry date to user

```sh
userdel maestro 
```

delete maestro

```sh
userdel -r maestro 
```

delete maestro and hir homefolder

```sh
groups 
```

find which group you are in


```sh
id 
```

same

```sh
id -Gn maestro 
```

Find which groups maestro is in


```sh
deluser --remove-home maestro 
```

delete user maestro


```sh
usermod -aG sudo maestro 
```

Add user maestro to group sudo:


```sh
cat /etc/passwd 
```

list users' passwords (and therefore users)

```sh
groupadd awesome 
```

create the group 'awesome'

Passwords are stored in /etc/shadow.

There are user accounts for processes such as 'bin' and 'nobody' which are locked, so they're unusable.

```sh
passwd -l bin 
```

Lock the user 'bin'.

```sh
more /etc/passwd | grep games 
```

we find the name, password and user id of the user 'games'. I.e. the password is 'x', and the user id is '5'.  The password is an impossible hash, so no input password could match.

```sh
groupdel learners | delete the group 'learners'
```

```sh
gpasswd -d pi games | remove user 'pi' from the group 'games'
```

```sh
id games 
```

find the id number of group 'games' (60)

```sh
usermod -aG sudo maestro 
```

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

```sh
usermod -l henry mark
```

However, this will not change the home directory.

Lock a user out of an account:

usermod -L henry

# More Arguments

-G or -groups adds the user to other groups:

```sh
usermod -G sudo henry
```

-s adds the user to a shell.

-u let's you manually specifiy a UID.

# Groups

In /etc/group, a group file may look like this:

`sudo:x:27:mike,steve`

We can use groupmod, like like usermod, e.g. to change a name:

```sh
groupmod -n frontoffice backoffice
```

Delte a group:

```sh
groupdel frontoffice
```

# Logins

See list of logged on users.

```sh
w
```

See last logons:

```sh
last
```

or all logon attempts, including bad attempts:

```sh
lastb
```

List recently accessed files:

```sh
last -d
```

See files opened by steve

```sh
lsof -t -u steve
```

See files opened by anyone but steve

```sh
lsof -u ^steve
```

# Looking for Dodgy Files

Some files can be executed by people as if they had super user permissions, and that's okay... sometimes.

Let's start with files executable by user:

```sh
sudo find / -type f -perm -g=s -ls
```

And then those executable by the group:

```sh
find / -type f -perm -g=s -ls
```

And finally, worrying files, executable by anyone as if sie were the owner:

```sh
find / -xdev \( -o -nogroup \) -print
```

Then have a look at resource usage per user.

# SGID

```sh
sudo chmod u+s process.sh
```

This will modify process.sh to that instead of being simply executable, anyone executing it will have the permissions as if owner while executing it.

