---
title: nginx logs with recfiles
tags: 
- data
- recfiles
- logs
requires: 
- recfiles
- nginx
---

The standard `nginx` log format has such a lack of consistency or meaning that you might squint your face into a whirlpool making sense of them:


```nonsense
18.97.14.85 - - [16/Nov/2025:00:52:12 +0100] "GET /posts/learning_without_experts/content.html HTTP/1.1" 200 1704 "-" "CCBot/2.0 (https://commoncrawl.org/faq/)"
57.141.0.25 - - [16/Nov/2025:00:52:18 +0100] "GET /posts/hope_you_win/ HTTP/1.1" 200 61997 "-" "meta-externalagent/1.1 (+https://developers.facebook.com/docs/sharing/webmasters/crawler)"
201.17.157.249 - - [16/Nov/2025:00:52:19 +0100] "GET https://ttrpgs.com/post/wp/ HTTP/1.1" 200 45202 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"
47.246.164.151 - - [16/Nov/2025:00:52:22 +0100] "GET https://ttrpgs.com/css/styles.dc38388a8f0b890e788bd3a99b7495d14e7d5ac4359ed3b49abeb778497863b284ad4cc7e496ef58c84139295f9bafed82f5a41345eda86bd2d429cccb7c2596.css HTTP/1.1" 200 27109 "https://ttrpgs.com/post/wp/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"
47.246.164.154 - - [16/Nov/2025:00:52:22 +0100] "GET https://ttrpgs.com/fonts/Metropolis-MediumItalic.woff2 HTTP/1.1" 200 28100 "https://ttrpgs.com/css/styles.dc38388a8f0b890e788bd3a99b7495d14e7d5ac4359ed3b49abeb778497863b284ad4cc7e496ef58c84139295f9bafed82f5a41345eda86bd2d429cccb7c2596.css" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"
47.246.164.135 - - [16/Nov/2025:00:52:22 +0100] "GET https://ttrpgs.com/fonts/Metropolis-Regular.woff2 HTTP/1.1" 200 24152 "https://ttrpgs.com/css/styles.dc38388a8f0b890e788bd3a99b7495d14e7d5ac4359ed3b49abeb778497863b284ad4cc7e496ef58c84139295f9bafed82f5a41345eda86bd2d429cccb7c2596.css" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"
```

Someone created this logging format on purpose, to make sure nobody could parse it with a hundred `column`, `cut`, or `awk` pipes.

The problem lies in `/etc/nginx/nginx.conf`:


```conf
log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                  '$status $body_bytes_sent "$http_referer" '
                  '"$http_user_agent" "$http_x_forwarded_for"';
```

Despite a request of three strings, this format returns one string.

It can output to recfile format like this:


```conf
log_format  main  '\nIP: $remote_addr\n'
                 'User: $remote_user\n'
                 'Date: $time_local\n'
                 'Request: $request\n'
                 'Status: $status\n'
                 'Bytes: $body_bytes_sent\n'
                 'Referrer: $http_referer\n'
                 'Agent: $http_user_agent\n'
                 'XForward: $http_x_forwarded_for\n';

access_log  /var/log/nginx/access.rec  main;
```

Note the newline (`\n`) symbol, required to start a new entry on a new line.

1. `cp /etc/nginx.conf /etc/nginx.conf.bak`
1. Change `/etc/nginx.conf` to match the format above.
1. Check the file works with `nginx -t`.
1. Restart the `nginx` service.
1. Access that web page to make sure that at least one log exists.
1. Check the file with `recfix /var/log/nginx/access.rec`.

Once it works, you can add the usual recfile headers:


```sh
sed -i '1 i \ ' /var/log/nginx/access.rec
sed -i '1 i %rec: Weblog' /var/log/nginx/access.rec
sed -i '2 i %doc: nginx access logs' /var/log/nginx/access.rec
```
