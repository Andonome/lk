---
title: "cronie"
tags: [ "Documentation", "System" ]
---

Various services from cron exist, e.g.

> sudo apt -y install cronie

start the cronie with

> sudo Systemctl start cronie

start a cron with 

> cron -e

You can run a script with:

*/10 * * * * /home/pi/script.sh

... which would run every 10 minutes.

To run something as root, do:

> sudo crontab -e

For example, you can update the database, meaning searches with 'locate' command will be faster.

> */30 * * * * /usr/bin/updatedb



