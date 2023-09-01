---
title: "QR Codes"
tags: [ "Documentation", "qrencode", "zbar" ]
---

Make a QR Code image:

```bash
qrencode 'https://play.google.com/store/apps/details?id=org.briarproject.briar.android' -o "$FILE".png
```

Make a QR Coded message in the terminal:

```bash
qrencode -t ansi "Hello World"
```

Read a QR Code image:

```bash
zbarimg $FILE
```

Show wifi QR code (only with Network Manager):

```bash
nmcli device wifi show-password
```
