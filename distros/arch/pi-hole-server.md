
> yay -S pi-hole-server pi-hole-ftl

> sudo systemctl disable systemd-resolved

> sudo systemctl stop systemd-resolved

> sudo systemctl enable pi-hole-server pihole-FTL

> sudo systemctl start pi-hole-server pihole-FTL

Remove that google dns server.

> pihole -a setdns 1.1.1.1 1.0.0.1

Disable pihole password by setting a blank password.

> pihole -a -p

# Configure cloudflare DNS

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

