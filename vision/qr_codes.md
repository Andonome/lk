---
title: "QR Codes"
tags: [ "qrencode", "zbar" ]
---

Make a QR Code image:

```sh
qrencode 'https://play.google.com/store/apps/details?id=org.briarproject.briar.android' -o "$FILE".png
```

Make a QR Coded message in the terminal:

```sh
qrencode -t ansi "Hello World"
```

Read a QR Code image:

```sh
zbarimg $FILE
```

Show wifi QR code (only with Network Manager):

```sh
nmcli device wifi show-password
```
