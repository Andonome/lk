---
title: "nginx"
tags: [ "Documentation", "Networking" ]
---
Install nginx:

```bash
sudo apt-get install nginx
```

```bash
sudo apt-get enable --now nginx
```

Put a website somewhere:

```bash
mkdir /var/www/html/mysite/
```

Put an index file there:

```bash
vim /var/www/html/mysite/index.html
```

Make the owner `www-data`

```bash
chown -R www-data:www-data /var/www/html/mysite/
```

Make a configuration file for nginx:

```bash
vim /etc/nginx/sites-available/mysite.conf
```


```
server {
        listen 80;
        listen [::]:80;
        root /var/www/html/mysite;
        index index.html index.htm;
        server_name mysite.tk;

   location / {
       try_files $uri $uri/ =404;
   }

}
```

Make the site available:

```bash
ln -s /etc/nginx/sites-available/mysite.conf /etc/nginx/sites-enabled/
```

Test it's working:

```bash
nginx -t
```

## Troubleshooting

If it's not working, the error message ends with the line number of the problem in the .conf file.
If the error message says '4', the error message is probably around line 4.

Check:

- Missing semicolons
- Very long website names
   * Fixing this requires uncommenting `server_names_hash_bucket_size 64;` in /etc/nginx.conf
   * If that doesn't work, try changing '64' in that line to '128'.

## DNS

Buy some DNS online, then check it's working.

*Once it's working*, use certbot:

```bash
apt install certbot
```

You may need to install an nginx python module:

```bash
apt install python3-certbot-nginx
```

```bash
domain=example.com
my_email=me@posteo.uk
certbot --nginx -d "$domain" --non-interactive --agree-tos -m "$my_email"
```

When you are asked about redirecting from HTTP to HTTPS, say yes (option "2").

## Renewal

Remember to renew the certificate every few months.

# Multiple Sites

You can do this with any number of websites at the same time.

