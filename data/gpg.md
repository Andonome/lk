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

# Circles of Trust

Search for a key at any key store:

> gpg --keyserver sks.hklbgd.org --search-keys nestorv

Once you've made a decision about someone:

> gpg --list-keys

You get something like this:

```
pub   rsa3072 2021-08-15 [SC] [expires: 2023-08-15]
      CD30421FD825696BD95F1FF644C62C57B790D3CF
uid           [ultimate] Malin Freeborn <malinfreeborn@posteo.net>
sub   rsa3072 2021-08-15 [E] [expires: 2023-08-15]

```

Notice the long, ugly, string - CD30421FD825696BD95F1FF644C62C57B790D3CF - and how horribly ugly it is.
This is a fingerprint.

You can now decide the trust level (this stays on your computer).

> gpg edit (some fingerprint)

Once you're in the interface, type `trust [some fingerprint]`.

> gpg --sign-key alice@posteo.net

# Refresh Keys

> gpg --keyserver sks.hklbgd.org --refresh-keys

