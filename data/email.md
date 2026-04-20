---
title: e-mail
tags: 
- data
- smtp
---

This is bare-bones, original, primitive e-mail.

Install `opensmtpd` (or similar), then `ncat` or `nc` or `netcat` (this mysterious cat has many names).

Start the `opensmtpd` service, then use netcat to speak with the mail-daemon:

```sh
nc localhost 25
```

The computer should respond with code `220`, which means 'I am listening'.

> 220 hex ESMTP OpenSMTPD

```
HELO gmail.com
```

You say `HELO` and say where you are coming from.


The `smtpd` will not check, so I am going to lie to it.
Mail servers are easily impressed, so it will be pleased to meet you.

> 250 hex Hello gmail.com [::1], pleased to meet you

```
MAIL FROM: <admin@gmail.com>
```

All the mail commands start with 4 bytes, because it's easier for admins to program.
Tell the mail daemon who you are in this format.

> 250 2.0.0 Ok

Then tell it who you're sending to.

```sh
RCPT TO: <www@dmz.rs>
```

> 250 2.1.5 Destination address valid: Recipient ok

Finally, tell it that you want to send `DATA`.

```
DATA
```

> 354 Enter mail, end with "." on a line by itself

```
Subject: turn off server please

very urgent
.
```

> 250 2.0.0 73864a49 Message accepted for delivery

You will find the email under `/var/spool` or `/var/mail` or similar.

If unsure, just take a part of your email, like `FRAGMENT="turn off server please"`, then `grep` for it:

 ```sh
sudo grep -r $FRAGMENT /var/spool/*
 ```

