
# Get a hostname

> sudo vim /etc/tor/torrc

Uncomment the lines about `/var/lib/tor/hidden_services`, including port 22 (or whatever); restart tor, then go to that directory, and cat the hostname.

