---
title: "radicale and nginx"
tags: [ "data", "calendar" ]
---

Check before you start:

- you have a normally running site on nginx already.
- your server has the directory `/etc/nginx/sites-enabled/` enabled in the nginx config.

## Installation and Service

Install `radicale` through your package manager (not `pip`).
The standard `radicale` package should come with a nice `systemd` service file.

If the service comes already-started, stop it immediately:

```bash
sudo systemctl stop radicale
```

## Set up Passwords

Edit `/etc/radicale/config`, changing the `[auth]` section from this:

```
#type = none
```

...to this:
```
type = htpasswd
```

Make sure the service is off, as people may be able to sign in without a password at this point.

Next, find the `htpasswd` program.
You might get it in the `apache` package or similar.

`htpasswd` allows you to generate passwords for users, and place them in `/etc/radicale/users`.

```bash
PASS="$(xkcdpass)"
htpasswd -nb $USER "$PASS" | sudo tee -a /etc/radicale/users
echo "Your username is $USER"
echo "Your password is $PASS"
```
Right now, you can't sign into the server except through the localhost, which is pointless.
So now we add a subdomain to `nginx`.

```nginx

echo '
 server {
    if ($host = cal.DOMAIN) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


     listen 80;
     server_name cal.DOMAIN;
                                                                                        
     location / {
         proxy_pass http://localhost:5232;
         proxy_set_header Host $host;
         proxy_set_header X-Real-IP $remote_addr;
         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     }
                                                                                        
     return 301 https://$server_name$request_uri;
 

}
                                                                                        
 server {
     listen 443 ssl;
     server_name cal.DOMAIN;
    ssl_certificate /etc/letsencrypt/live/cal.DOMAIN/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/cal.DOMAIN/privkey.pem; # managed by Certbot
                                                                                        
     location / {
         proxy_pass http://localhost:5232;
         proxy_set_header Host $host;
         proxy_set_header X-Real-IP $remote_addr;
         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     }
 
}
' > /etc/nginx/sites-available/radicale
sudo ln -s /etc/nginx/sites-available/radicale /etc/nginx/sites-enables/
```

Finally, replace the example `DOMAIN` with your actual domain name.

```bash
DOMAIN=whatever.com
sudo sed -i "s/DOMAIN/$DOMAIN/g" /etc/nginx/sites-available/radicale 
```

(optional: replace that `cal.` prefix with anything else)

Check nginx is happy:

```bash
sudo nginx -t
```
You will almost certainly need a new SSL certificate for the site:

```bash
sudo certbod -d cal.$DOMAIN
```

Start or restart both services:

```bash
sudo systemctl start radicale
sudo systemctl restart nginx
```

You should now be able to log into your calendar, and add it to a phone.

**NB:** you don't need the port number.
