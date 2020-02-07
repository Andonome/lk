# Making keys

Generate keys:

> gpg --gen-key

Follow the guide.

# Encrypting a file

> gpg -r malinfreeborn@tutamail.com -e file

`-r` specifies the recipient.

Check you have an encrypted version of your file.

# Changing Expiration Dates

gpg --list-keys

... and then use the second part of 'pub', which is the ID.  But that's not appearing here so... on with gpg2?

# Making encrypted files with a local password

Make a password with a password (cypher encryption).

> gpg -c --output passwords.txt

or 

> gpg -c > passwords.txt

Put in a password.

Write message then stop with Ctrl+d.

Get the message back out the file with:

> gpg -d passwords.txt

