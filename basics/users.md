---
title: "users"
tags: [ "Documentation", "Basics" ]
---
# Basic Information

Let's get some entries with 'getent', e.g. passwd or group.

```bash
getent passwd
```

```bash
getent group
```

Obviously:

```bash
getent shadow
```

## Examples

```bash
sudo adduser maestro 
```

add user 'maestro'

This depends upon the settings in the /etc/default/useradd file and /etc/login.defs

```bash
sudo useradd -m pinkie 
```

add user 'pinkie' with a home directory

```bash
sudo adduser -m -e 2017-04-25 temp 
```

add expiry date to user

```bash
userdel maestro 
```

delete maestro

```bash
userdel -r maestro 
```

delete maestro and hir homefolder

```bash
groups 
```

find which group you are in


```bash
id 
```

same

```bash
id -Gn maestro 
```

Find which groups maestro is in


```bash
deluser --remove-home maestro 
```

delete user maestro


```bash
usermod -aG sudo maestro 
```

Add user maestro to group sudo:


```bash
cat /etc/passwd 
```

list users' passwords (and therefore users)

```bash
groupadd awesome 
```

create the group 'awesome'

Passwords are stored in /etc/shadow.

There are user accounts for processes such as 'bin' and 'nobody' which are locked, so they're unusable.

```bash
passwd -l bin 
```

Lock the user 'bin'.

```bash
more /etc/passwd | grep games 
```

we find the name, password and user id of the user 'games'. I.e. the password is 'x', and the user id is '5'.  The password is an impossible hash, so no input password could match.

```bash
groupdel learners | delete the group 'learners'
```

```bash
gpasswd -d pi games | remove user 'pi' from the group 'games'
```

```bash
id games 
```

find the id number of group 'games' (60)

```bash
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

```bash
usermod -l henry mark
```

However, this will not change the home directory.

Lock a user out of an account:

usermod -L henry

# More Arguments

-G or -groups adds the user to other groups:

```bash
usermod -G sudo henry
```

-s adds the user to a shell.

-u let's you manually specifiy a UID.

# Groups

In /etc/group, a group file may look like this:

`sudo:x:27:mike,steve`

We can use groupmod, like like usermod, e.g. to change a name:

```bash
groupmod -n frontoffice backoffice
```

Delte a group:

```bash
groupdel frontoffice
```

# Logins

See list of logged on users.

```bash
w
```

See last logons:

```bash
last
```

or all logon attempts, including bad attempts:

```bash
lastb
```

List recently accessed files:

```bash
last -d
```

See files opened by steve

```bash
lsof -t -u steve
```

See files opened by anyone but steve

```bash
lsof -u ^steve
```

# Looking for Dodgy Files

Some files can be executed by people as if they had super user permissions, and that's okay... sometimes.

Let's start with files executable by user:

```bash
sudo find / -type f -perm -g=s -ls
```

And then those executable by the group:

```bash
find / -type f -perm -g=s -ls
```

And finally, worrying files, executable by anyone as if sie were the owner:

```bash
find / -xdev \( -o -nogroup \) -print
```

Then have a look at resource usage per user.

# SGID

```bash
sudo chmod u+s process.sh
```

This will modify process.sh to that instead of being simply executable, anyone executing it will have the permissions as if owner while executing it.

