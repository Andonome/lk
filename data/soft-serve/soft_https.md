---
title: Soft Serve through https
tags: 
- data
- git server
- lfs
requires: 
- data/git.md
- networking/nginx.md
---

## `http` Setup

In this example, the port used is `23231`, but it can be anything.
Open `/var/lib/soft-serve/data/config.yaml` and make sure the `http` section looks like this:

```
# The HTTP server configuration.
http:
  # The address on which the HTTP server will listen.
  listen_addr: ":23232"

  # The path to the TLS private key.
  tls_key_path: ""

  # The path to the TLS certificate.
  tls_cert_path: ""

  # The public URL of the HTTP server.
  # This is the address that will be used to clone repositories.
  # Make sure to use https:// if you are using TLS.
  public_url: "http://localhost:23232"

```

Restart the `soft-serve` service, then check it's working by cloning from localhost:

```sh
git clone http://localhost:23232/${some_repo}.git
```

### `https` Setup

Put this file at `/etc/nginx/sites-enabled/$DOMAIN.tld`, then set up standard certificates with [nginx](../../networking/website/nginx.md).

(replace `${DOMAIN_NAME}` with your domain's name).

```
 server {
     listen 80;
     server_name ${DOMAIN_NAME};
                                                                                        
     location / {
         proxy_pass http://localhost:23232;
         proxy_set_header Host $host;
         proxy_set_header X-Real-IP $remote_addr;
         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     }
                                                                                        
     return 301 https://$server_name$request_uri;
}
                                                                                        
 server {
     listen 443 ssl;
     server_name ${DOMAIN_NAME};

     location / {
         proxy_pass http://localhost:23232;
         proxy_set_header Host $host;
         proxy_set_header X-Real-IP $remote_addr;
         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     }
}

```

