
# List Out DNS

> echo "addn-hosts=/etc/pihole/lan.list" | sudo tee /etc/dnsmasq.d/02-lan.conf

Then edit that list

> sudo vim /etc/dnsmasq.d/02-lan.conf

`192.168.0.10    ratking.lan    ratking`

Then restart the pihole's dns:

> sudo pihole restartdns

#View DNS traffic

> pihole -t

#Change password 

> pihole -a -p

# Get new list of cancer

> pihole -g

