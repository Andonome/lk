---
title: "profanity"
tags: [ "Documentation", "chat" ]
---

# Pre Setup

Sign up to an account somewhere.

> /connect bob@bobserver.org

Check if someone wants to be your friend:

> /sub received

Accept a friend's subscription request:

> /sub add alice@aliceserver.org

Join a room:

> /join room1@bobserver.org

# Starting

> profanity

> /help ui theme

> theme load batman

# omemo

> /omemo gen

> /omemo start

# otr

Install libotr-dev or libotr5-dev or whatever..

> sudo apt -y install lib5otr-dev

Make your otr keys.

> /otr gen

Then you can start an otr converstation.

> /otr start bob@jobbies.org

Or if you already havea  conversation windows open, switch to otr using:

> /otr

Finally, verify!

/otr question "Who the fuck are you?" bob

Bob is verified upon the answer, 'bob'.

# Finger Prints

Get yours with 

> /otr myfp

> /otr theirfp

> /otr myfp

