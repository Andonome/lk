
> yay -S pi-hole-server

> sudo systemctl enable --now pihole-FTL

> sudo systemctl disable --now systemd-resolved

Add yourself as a pihole user, then logout, and log back in.

> sudo usermod -aG pihole $USER

Remove that google dns server.

> pihole -a setdns 9.9.9.9 1.0.0.1

Disable pihole password by setting a blank password.

> pihole -a -p

Get a new list of blocked domains, then reload:

> pihole -g -r

Every so often, run `pihole -g` again (perhaps put it in crontab).

# Configure cloudflare DNS

This is optional.

> yay -S cloudflared-bin

echo "proxy-dns: true
proxy-dns-upstream:
 - https://1.0.0.1/dns-query
 - https://1.1.1.1/dns-query
 - https://2606:4700:4700::1111/dns-query
 - https://2606:4700:4700::1001/dns-query
proxy-dns-port: 5053
proxy-dns-address: 0.0.0.0" > /etc/cloudflared/cloudflared.yml

echo "
PRIVACYLEVEL=0
IGNORE_LOCALHOST=no
AAAA_QUERY_ANALYSIS=yes

