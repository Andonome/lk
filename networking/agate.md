---
title: Agate on Arch Linux
tags: 
- networking
- arch
- gemini
---

Docs are [here](https://github.com/mbrubeck/agate).

You will need DNS set up before proceeding.

Install agate.

`yay -S agate`

Be root!

In my case the domain is 'splint.rs'.

`DOMAIN1=splint.rs`

You can set up any number of domain names.

`DOMAIN2=ttrpgs.com`

Make a directory to serve the gemini files from:

`GEMDIR=/srv/gemini`

`mkdir -p $GEMDIR/$DOMAIN1`

`mkdir -p $GEMDIR/$DOMAIN2`

Put at least one gemini file into the directory:

```
echo Welcome to $DOMAIN1 > $GEMDIR/$DOMAIN1/index.gmi
echo Welcome to $DOMAIN2 > $GEMDIR/$DOMAIN2/index.gmi
```

Set a language variable:

`LANG=en_GB`

You need to run the agate command once interactively, in order to create certs:

```
agate --content $GEMDIR --certs $GEMDIR/.certs \
    --addr [::]:1965 --addr 0.0.0.0:1965
    --hostname $DOMAIN1 --hostname $DOMAIN2
    --lang $LANG
```

Once that works, it's time to make a service file; select any name for it:

`SVFILE=st`

```
echo "
CONTENT=--content $GEMDIR
CERT=--certs $GEMDIR/.certs
ADDR=--addr [::]:1965 --addr 0.0.0.0:1965
HOSTNAME=--hostname $DOMAIN1 --hostname $DOMAIN2
LANG=--lang $LANG
" > $SVFILE.conf
```

Check the service file has all those variables and looks right:

`cat $SVFILE.conf`

Now move it into the agate config directory:

`mv $SVFILE.conf /etc/agate/`

And finally, start the service:

```
systemctl daemon-reload
systemctl enable --now agate@$SVFILE.conf
```

Your Gemini capsule should be available, and you should be able to see any access in the logs:

```
journalctl -xeu agate@$SVFILE.conf
```

