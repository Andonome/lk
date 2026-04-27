---
title: Download Website
tags: 
- networking
- scraping
- web
---

```sh
domain=splint.rs
mkdir $domain
cd $domain
wget --recursive --convert-links --backup-converted \
    --page-requisites --level=inf --adjust-extension \
    -U "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)" \
    -p --mirror --html-extension --convert-links \
$domain
```
