# List Services

All possible services are in:

> ls /etc/sv

The computer only uses those in /var/service, so symbolic links are made to start and stop services.

> ls /var/service

# Start Services

Enable the sshd service, so that ssh will work every time you boot up:

> sudo ln -s /etc/sv/sshd /var/service

Then start the service:

> sudo sv start sshd

# Stop Services

Stop `mpd` with:

> sudo sv stop mpd

And stop it starting at startup with:

> sudo rm /var/service/mpd

You can also just make a file called 'down':

> sudo touch /var/service/mpd/down

This means you can start and stop the service without making symbolic links, but mpd will be 'down' when the computer starts.

# Making a Service

Look in the `/etc/sv` directory, then in the existing services' 'run' files.
You'll find a simple dash script (therefore Posix compliant).

You can write your own, just stick in the shebang `#!/bin/sh`.

If unsure, use `#!/bin/bash` as the first line.  When Void Linux says `sh`, it means `dash` shell, not `bash`.

Confirm the shell you'll use:

> ls -l $(which sh)

