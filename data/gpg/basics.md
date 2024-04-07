---
title: "GPG Basics"
tags: [ "Documentation", "data", "GPG" ]
---
# Making keys

Generate keys:

```bash
gpg --gen-key
```

Follow the guide.

# Encrypting a file

```bash
gpg -r malinfreeborn@posteo.net -e file
```

`-r` specifies the recipient.

Check you have an encrypted version of your file.

# Changing Expiration Dates

gpg --list-keys

... and then use the second part of 'pub', which is the ID.  But that's not appearing here so... on with gpg2?

# Making encrypted files with a local password

Make a password with a password (cypher encryption).

```bash
gpg -c --output passwords.txt
```

or 

```bash
gpg -c > passwords.txt
```

Put in a password.

Write message then stop with Ctrl+d.

Get the message back out the file with:

```bash
gpg -d passwords.txt
```

# Circles of Trust

Search for a key at any key store:

```bash
gpg --search-keys nestorv
```

Once you've made a decision about someone:

```bash
gpg --list-keys
```

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

```bash
gpg --edit-key CD30421FD825696BD95F1FF644C62C57B790D3CF
```

Once you're in the interface, type `trust`.

```bash
gpg --sign-key alice@posteo.net
```

# Swapping Keys

This system relies on a ring of people swapping key information.

## Sending

Send those trusted keys up to a server, so people can see you have verified them:

```bash
gpg --send-keys 024C6B1C84449BD1CB4DF7A152295D2377F4D70F
```

## Upload Your Keys

## Add More Key Servers

Key servers often swap keys, but it's best to just send to multiple places immediately.
You can add key servers by adding this to `~/.gnupg/gpg.conf`.

```
keyserver hkps://keys.openpgp.org
keyserver hkps://mail-api.proton.me
keyserver hkps://keys.mailvelope.com
```

# Refresh Keys

Refreshing keys will tell you if some key you have contains a signature from someone you already trust, or if someone has published a revocation certificate (meaning their key should not be trusted any more).

```bash
gpg --refresh-keys
```

You can use the [crontab](../basics/cron.md) to refresh keys.

# Export

Your public key:

```bash
gpg --output me.gpg --armor --export
```
Alternatively:

```bash
gpg --export -a person@email.tld > my_key.pub
```

