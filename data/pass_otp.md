---
title: pass with otp
tags: 
- data
- credentials
- secrets
- 2fa
- otp
requires: 
- pass
---

Need a Microsoft or Google authenticator?
No you don't.

These usually come in the form of QR codes.


```qr code

                                 
    █▀▀▀▀▀█ ▀ ▀▀▀ ▀ ▄ █▀▀▀▀▀█    
    █ ███ █ ▄▄▀▄▄▀▄▄▀ █ ███ █    
    █ ▀▀▀ █ ██ ▀▄██▀▀ █ ▀▀▀ █    
    ▀▀▀▀▀▀▀ █ █▄▀ █ █ ▀▀▀▀▀▀▀    
    █▄▄ █▄▀▀██ ▄▄▀▀▄██▀▀██ ▄▀    
    ▄██▄▀█▀█ ▀▄▀ █▀▀▀█ ▀▀▀█▄     
    ▄ ▄▄█ ▀▀ ▄▄▀▀█▄█ ▀▀ ▄▀▀█▀    
      █ ▀ ▀▀█▀▀ ▄ ▄█▀▄▀██▀█▄     
    ▀▀▀ ▀ ▀ █▄▄▀▄▀▀▄█▀▀▀█▀▀      
    █▀▀▀▀▀█ ▀▄ █▀█▀ █ ▀ █▄▄      
    █ ███ █ ▀ ▄ ▀█▄ ████▀▀█▄█    
    █ ▀▀▀ █  ▄▀ ▄ ▄▄ ██▄▄█▄█     
    ▀▀▀▀▀▀▀ ▀ ▀▀ ▀▀▀ ▀▀   ▀▀▀    
                                 
                                 
```

Download the code, and get the information out:


```sh
zbarimg qr.png 
otp="$(zbarimg qr.png | sed 's/QR-Code://')"
otp_name=site.org.otp
echo "${otp}" | pass otp add --echo "${otp_name}"
```

Show the OTP:


```sh
pass otp "${otp_name}"
```
