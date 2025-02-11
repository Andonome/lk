---
title: "profanity"
tags: [ "Chat", "OTR" ]
---
# otr

'Off The Record' encryption seems mostly dead to me.
But this is what I did, back in the day...

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

