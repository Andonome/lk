---
title: "profanity"
tags: [ "Documentation", "Chat" ]
---
# Setup (Commands)

Sign up to an account somewhere.

```
/connect bob@bobserver.org
```

Check if someone wants to be your friend:

```
/sub received
```

Accept a friend's subscription request:

```
/sub add alice@aliceserver.org
```

Join a room:

```
/join room1@bobserver.org
```

Save your configuration so you don't have to do this again:

```
/save
```

Check your `~/.config/profanity/profrc` for how to data's saved.

## Automatically Sign In

To automatically sign in, add your password to [pass](../data/pass.md).

```
/account set *malin@oosm.org* eval_password pass *xmpp*
```

```
/autoconnect set *malin@oosm.org*
```

```
/save
```

Remember to save the config for other commands too.

# General Use

## Messages

```
/msg alice@aliceserver.org
```

This opens in a new tab.
Switch tabs with alt+number.

## Docs

The [docs](https://profanity-im.github.io/guide/0131/reference.html) are massive, so it's often better to use:

```
/help <Tab>
```

## Editing

For long text, you can use vim:

```
/executable editor set vim
```

```
/editor
```

## Sending & Receiving Files

Tell it how to save files:

```
/executable urlsave set "wget %u -O %p"
```

Then get the file with:

```
/urlsave *<Tab>*
```

Same for `/urlopen`

## Theme

```
profanity
```

```
/theme list
```

```
theme load batman
```

# Encryption

## omemo

```
/omemo gen
```

```
/omemo start
```

You can accept everyone's fingerprint all the time with

```
/omemo trustmode firstusage
```

This will still encrypt, but there will be no check that you have the right person the first time you speak with someone.

You can ensure omemo automatcally turns on:

```
/omemo policy automatic
```

## otr

Install libotr-dev or libotr5-dev or whatever..

```
sudo apt -y install lib5otr-dev
```

Make your otr keys.

```
/otr gen
```

Then you can start an otr converstation.

```
/otr start bob@jobbies.org
```

Or if you already have a conversation windows open, switch to our using:

```
/otr
```

Finally, verify!

```
/otr question "Who are you?" bob
```

Bob is verified upon the answer, 'bob'.

### OTR Finger Prints

Get yours with 

```
/otr myfp
```

```
/otr theirfp
```

```
/otr myfp
```

