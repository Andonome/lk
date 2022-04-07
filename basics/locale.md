---
title: "locale"
tags: [ "Documentation", "Basics" ]
---

A list of supported locales is available at /usr/share/i18n/SUPPORTED

See a full list with:

> cat /usr/share/i18n/SUPPORTED

Take the first portion to generate full locale information for a region:

> locale-gen ru_RU.UTF-8

Then use this for the current shell session with

> LANG=ru_RU.utf8

Expand this to the entire system with: 

> export LANG=ru_RU.utf8

You can make this permanent for one user by adding this line to the ~/.profile or ~/.bashrc.

Make it permanent for the entire system by editing:

> sudo vim /etc/defaults/locale

# Variables

While generally set together, the variables setable are:

| Variable                              | Description                                                    |
|:-------------------------------------:|:---------------------------------------------------------------|
| LC_TIME                               | Date and time                                                  |
| LC_NUMERIC                            | Nonmonetary numeric formats                                    |
| LC_PAPER                              | A4 vs wrong paper                                              |
| LC_ADDRESS                            | Address formats, for those amazingly concise Polish addresses. |
| LC_TELEPHONE                          | Telephone number formats.                                      |
| LC_MEASUREMENT                        | Metric or Imperial, but no Impetric available.                 |
| LC_IDENTIFICATION                     | Metadata about the locale information                          |
| LC_ALL                                | Just everything at once.                                       |

