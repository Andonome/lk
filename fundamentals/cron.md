Anacron manages crontabs which might not have run because the machine was turned off.  The first value shows the days between runs, the second shows how many minutes to wait after a boot to run.

For example:

> cat /etc/anacrontab

`7 15 cron.daily run-parts --report /etc/cron.daily`

This would run crontab every 7 days, and wait 15 minutes until after boot to run.


Various services from cron exist, e.g.

> sudo apt -y install cronie

start the cronie with

> sudo systemctl start cronie

start a cron with 

> cron -e

You can run a script with:

*/10 * * * * /home/pi/script.sh

... which would run every 10 minutes.

To run something as root, do:

> sudo crontab -e

For example, you can update the database, meaning searches with 'locate' command will be faster.

> */30 * * * * /usr/bin/updatedb


# Testing with runparts

Run-parts runs all executable scripts in a directory.

> run-parts /etc/cron.hourly

