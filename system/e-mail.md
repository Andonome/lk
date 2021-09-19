# Terminology

|MTA | Mail transfer agent |
|POP3| Post Office Protocol 3 |
|SMTP| Simple Mail Transfer Protocol|
|IMAP| Internet Message Access Protocol|

There are a number of Linux e-mail agents - postfix, sendmail, exim (insecure) and qmail (dead).  

# Programs

> sudo apt-get install postfix mailutils

This will register your domain in the /etc/postfix/main.cf file.

# Internal Mail

> sendmail -t roach-1

Write a message and stop composition with Ctrl+D.

The mail is kept in /var/mail/ and you can read it with:

> mail

# Aliases

Aliases are groups of mail recipients.  The lists are kept under /etc/aliases.

`crew: matthew@gmail.com,ghost,danial@yahoo.com`

Update the list of aliases from this with:

> sudo newaliases

Then you can:

> sendmail -t crew

... and send to the whole crew.


View pending e-mails using:

> mailq


