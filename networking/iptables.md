# Intro

This is a basic Linux firewall program.

Look at your firewalls:

> iptables -L

We see the output of input, output and forwarding rules.

# Forward

I don't need any forwarding, so I'm going to drop all forwarding:

> iptables -P FORWARD DROP

# Input

Let's 'A'dd, or 'A'ppend a rule with -A.  Let's drop all input from a nearby IP 

> iptables -A INPUT -s 192.168.0.23 -j DROP

Or we can block all input from a particular port on the full network.

> iptables -A INPUT -s 192.168.0.0/24 -p tcp --destination-port 25 -j DROP

> iptables -A INPUT --dport 80 -j ACCEPT


This allows http traffic to an Apache web server over port 80.

However, rules are accepted in order - so a packet cannot be rejected and then accepted.

To delete rule 2 from the INPUT chain:

> iptables -D INPUT 3

Alternatively, you can 'I'nsert a rule at the start, rather than 'A'ppending it.

> iptables -I INPUT -s 192.168.0.13 DROP

# Catchalls

Catchall rules state that anything which is not permitted is forbidden.  They must be allowed last.

# -Jurice-Diction

The -j flag accepts ACCEPT/REJECT/DROP.  The last two are identical except that "REJECT" acknowledges the rejection.

Flush all existing rules with:

> iptables -F

