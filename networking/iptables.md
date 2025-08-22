---
title: "iptables"
tags: [ "networking" ]
---
# Intro

This is a basic Linux firewall program.

Look at your firewalls:

```sh
iptables -L
```

We see the output of input, output and forwarding rules.

# Forward

I don't need any forwarding, so I'm going to drop all forwarding:

```sh
iptables -P FORWARD DROP
```

# Input

Let's 'A'dd, or 'A'ppend a rule with -A.  Let's drop all input from a nearby IP 

```sh
iptables -A INPUT -s 192.168.0.23 -j DROP
```

Or we can block all input from a particular port on the full Network.

```sh
iptables -A INPUT -s 192.168.0.0/24 -p tcp --destination-port 25 -j DROP
```

```sh
iptables -A INPUT --dport 80 -j ACCEPT
```


This allows http traffic to an Apache web server over port 80.

However, rules are accepted in order - so a packet cannot be rejected and then accepted.

To delete rule 2 from the INPUT chain:

```sh
iptables -D INPUT 3
```

Alternatively, you can 'I'nsert a rule at the start, rather than 'A'ppending it.

```sh
iptables -I INPUT -s 192.168.0.13 DROP
```

# Catchalls

Catchall rules state that anything which is not permitted is forbidden.  They must be allowed last.

# -Jurice-Diction

The -j flag accepts ACCEPT/REJECT/DROP.  The last two are identical except that "REJECT" acknowledges the rejection.

Flush all existing rules with:

```sh
iptables -F
```


# Examples

```
# Allow all loopback (lo0) traffic and drop all traffic to 127/8
# that doesn't use lo0
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -d 127.0.0.0/8 ! -i lo -j REJECT --reject-with icmp-port-unreachable

# Allow established sessions to receive traffic
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow ICMP pings
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT

# Allow SSH remote
iptables -I INPUT -p tcp --dport 22 -j ACCEPT

# Reject all other inbound connections
iptables -A INPUT -j REJECT --reject-with icmp-port-unreachable
iptables -A FORWARD -j REJECT --reject-with icmp-port-unreachable
```
