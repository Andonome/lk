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

# Looking for dodgy files

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

