---
title: Send an email with a CLI command
tags: 
- email
requires:
- data/pass.md
---

# Setup the Config

Install `msmtp` and set up the defaults.

```sh
mkdir ~/.config/msmtp/
cat > ~/.config/msmtp/config << EOF
defaults
tls on
auth on

EOF
```

You'll need to fill in some variables, like your provider's hostname and SMTP port.
The `${pass_name}` is just the `pass` command which gives your email password.

```sh
name=posteo
host=posteo.de
port=587
user=bob@posteo.net
pass_name=posteo.net
```

With those in, add that default account.


```sh
cat >> ~/.config/msmtp/config << EOF

account ${name}
host ${host}
port ${port}
user ${user}
from ${user}
passwordeval pass ${pass_name}

```

Finally, set this as the default account:


```sh
account default : ${account} >> ~/.config/msmtp/config
```

# Write an Email

Fill out the headers in a file called `mail`.

```
From: MSMTP ${user}
Subject: Pipes
To: ${recipient_name} <${recipient_email}>

A pipe gives a wise man time to think and a fool something to stick in his
mouth.
```

# Send

Send the email:

```sh
msmtp -t bindrpg@posteo.uk < mail
```

