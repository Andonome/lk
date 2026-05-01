---
title: Stop email impersonating your domain
tags: 
- networking
requires:
- networking/dns_records.md
---

There is nothing to stop scammers from sending email claiming to be coming from your domain.
And the older it gets, the more valuable it is for spoofing.

Just add these two TXT records to the DNS for your domain:


Name   | Type | Value
:------|:----:|:-----
@      | TXT  | v=spf1 -all
_dmarc | TXT  | v=DMARC1; p=reject;

The first says there is not a single SMTP server on earth authorized to send email on behalf of your domain.
The second says that any email that says otherwise should be trashed.

