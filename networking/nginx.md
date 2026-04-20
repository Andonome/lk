---
title: nginx
tags: 
- networking
- web
---
Install nginx:

```sh
sudo apt-get install nginx
```

```sh
sudo apt-get enable --now nginx
```

Put a website somewhere:

```sh
mkdir /var/www/html/mysite/
```

Put an index file there:

```sh
vim /var/www/html/mysite/index.html
```

Make the owner `www-data`

```sh
chown -R www-data:www-data /var/www/html/mysite/
```

Make a configuration file for nginx:

```sh
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

```sh
ln -s /etc/nginx/sites-available/mysite.conf /etc/nginx/sites-enabled/
```

Test it's working:

```sh
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

```sh
apt install certbot
```

You may need to install an nginx python module:

```sh
apt install python3-certbot-nginx
```

```sh
domain=example.com
my_email=me@posteo.uk
certbot --nginx -d "$domain" --non-interactive --agree-tos -m "$my_email"
```

When you are asked about redirecting from HTTP to HTTPS, say yes (option "2").

## Renewal

Remember to renew the certificate every few months.

# Multiple Sites

You can do this with any number of websites at the same time.

