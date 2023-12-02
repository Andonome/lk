---
title: "locales"
tags: [ "void" ]
---

Check the current locales:


```bash
locale -a
```

Add the languages you want by editing `/etc/default/libc-locales`, and uncommenting your choice:

```bash
#en_DK.UTF-8 UTF-8  
#en_DK ISO-8859-1  
en_GB.UTF-8 UTF-8  
en_GB ISO-8859-1  
#en_HK.UTF-8 UTF-8  
#en_HK ISO-8859-1  
```

Now you can generate what you need for those languages.
However, instead of generating what you need, you're going to generate everything which needs updating:


```bash
sudo xbps-reconfigure glibc-locales
```

Finally, select your chosen locale by placing it in `/etc/locale.conf`.

```bash
echo "LC_ALL=en_GB.UTF-8
LANG=en_GB.UTF-8
LANGUAGE=en_GB.UTF-8" > /etc/locale.conf


#en_DK.UTF-8 UTF-8  
#en_DK ISO-8859-1  
en_GB.UTF-8 UTF-8  
en_GB ISO-8859-1  
#en_HK.UTF-8 UTF-8  
#en_HK ISO-8859-1  
```

Check your new locales are available:


```bash
locale -a
```

