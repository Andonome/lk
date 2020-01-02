# Free

See free space with:

> free

and make it human readable with:

> free -h

Or `-m` for megabytes.

# Proccesses

See running items in current terminal with 

> ps

or more with 

> ps -a

Or the entire system with

> ps -e

Or the entire system with more information, BSD style, with:

> ps aux

And then search for a particular program with 

> ps aux | grep cmus

# Jobs

Pause a job with ^z.  Put it in the background with the '&' suffix.

List jobs in the current shell with

> jobs

And then you can pull number 1 up again with 

> fg 1

Or continue running a stopped job with:

> bg 1

# Nice

This changes how nice a program is, from -20 (horrid) to 19.

Install a program, but nicely, at nice value '10':

> nice -10 sudo apt -y install libreoffice

Aggressively use Steam, with a nice value of '-13'.

> nice --13 steam&

Find out that Steam's fucking everything up, so you change its nice value with 'renice':

> renice --5 -p 3781

Nerf all of roach-1's processes:

> renice 10 -u roach-1

... or the entire group

> renice -14 -g hackers

