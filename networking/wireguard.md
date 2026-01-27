---
title: "wireguard"
tags: [ "networking", "VPN" ]
---
<!--
from 
https://engineerworkshop.com/blog/how-to-set-up-wireguard-on-a-raspberry-pi/
-->

## On Server

Install `wireguard-tools` on the server.

```sh
su root
cd /etc/wireguard
```

umask 077

```sh
wg genkey | tee server_private_key | wg pubkey > server_public_key
```

```sh
wg genkey | tee client_private_key | wg pubkey > client_public_key
```

```sh
    echo "
    [Interface]
    Address = 10.0.0.1/24
    SaveConfig = true
    PrivateKey = $(cat server_private_key)
    ListenPort = 51900
    
    PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
    
    [Peer]
    PublicKey = $(cat client_public_key)
    AllowedIPs = 10.0.0.2/32
    " > /etc/wireguard/wg0.conf
```

```sh
echo 'net.ipv4.ip_forward=1' > /etc/sysctl.d/wg.conf
```

```sh
systemctl enable --now wg-quick@wg0
```

```sh
chown -R root:root /etc/wireguard/
```

```sh
chmod -R og-rwx /etc/wireguard/*
```

Forward traffic from port 51900 to the server.

## Client

Be root.

Install `wireguard-tools` on the client.

Copy the client private key and server public key to the server (or just fill in the variables).


```sh
server_ip=$PUBLIC_IP

echo "
[Interface]
Address = 10.0.0.2/32
PrivateKey = $(cat client_private_key)
DNS = 9.9.9.9

[Peer]
PublicKey = $(cat server_public_key)
Endpoint = $(echo $server_ip:51900)
AllowedIPs = 0.0.0.0/0, ::/0
" > /etc/wireguard/wg0-client.conf

wg-quick up wg0-client

```

## Extras

### Multiple Peers

Add multiple peers by copying the `[peer]` section (they each get called `peer`).

### Make a QR Code for Mobile Users

Make a standard client configuration, then:

```sh
qrencode -t ansiutf8 < /etc/wireguard/mobile_user.conf
```
