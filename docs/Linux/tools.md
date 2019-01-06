
# Linux Tools

## Firewall 

#### UFW
UFW (Uncomplicated FireWall) is a simple wrapper for the Linux kernel's iptables firewall. 
To enable the firewall: `ufw enable` **DANGER: By default, this will block ALL incoming traffic
 unless otherwise configured!**

To allow SSH: `ufw allow ssh` OR `ufw allow in 22/tcp`

In general, the syntax is `ufw allow|deny|reject in|out port|app/tcp|udp`

To list current rules: `ufw status verbose`

To deny an IP or range to all ports: `ufw deny from IP/CIDR`

See also:
[ArchWiki](https://wiki.archlinux.org/index.php/Uncomplicated_Firewall)

### IPtables

IPtables is the Linux kernel's built in firewall. While more complex, it offers more 
features than a front-end and is found on all Linux systems. Please try to use UFW, 
detailed in the above section, if possible.

To view current IPtables rules: `iptables -nvL`

To give an example of output information, `Chain INPUT (policy ACCEPT 0 packets, 0 bytes)`
indicates that by default, all INPUT data (incoming) will be ACCEPTed. 

To change the Chain default: `iptables -P <CHAIN> <ACCEPT|REJECT|DROP>`

To allow SSH traffic over TCP port 22: `iptables -A INPUT -p tcp --dport 22 -j ACCEPT`

By default, rules are not preserved on system reboot.

See also:
[DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-iptables-on-ubuntu-14-04)

## Security

### Lynis 

Lynis is a Linux security auditing tool which scans the entire system and some running processes and reccomends specific hardening. To use, [download from GitHub](https://github.com/CISOfy/Lynis) and run `./lynis audit system`. A long list of suggestions and warnings will be output.

A custom auditing profile can be found in the scripts repo, but is not required.

### RKhunter

RKhunter is a Linux rootkit and backdoor scanner avalible in most repos. It checks for known backdoors, wrong file permissions, and checksums some binaries.

To run all checks (requires root): `rkhunter --check`
By default, the output is logged at `/var/log/rkhunter.log`

See also: 

* [Techmint](https://www.tecmint.com/install-rootkit-hunter-scan-for-rootkits-backdoors-in-linux/)

* [SUSE Wiki](https://en.opensuse.org/Rootkit_Hunter)


## User 

### Whowatch

Whowatch is a realtime user and process monitor. It interactivly shows the output of the `w` command, and allows you to kill the users login and processes from the TUI.

To launch, use the command `whowatch`. While in the TUI, press `s` to view system info, or `t` to view the process tree.

See also: [TechMint](https://www.tecmint.com/whowatch-monitor-linux-users-and-processes-in-real-time/)


### User information 

To see all logged in users, from where, and what they are doing, use the `w` command.

To list all user accounts on the system, see the `/etc/passwd` file. All users in the 'root' group or with UID 0, or named 'root' have superuser access.

Example:

`root:x:0:0:root:/root:/bin/bash` Is a superuser because the account is named root. It is also the superuser because it has user ID 0, and has group root. 

For more details on user entries, see [ArchWiki](https://wiki.archlinux.org/index.php/Users_and_groups#User_database).

Other user info commands:

* `last` - Displays login log for the system.
* `lastb` - Shows unsuccessful logins for the system.


## System

### Network

#### Interfaces

type `ifconfig -a` to show show all interfaces and their ip address

```
eth0      Link encap:Ethernet  HWaddr 00:0C:29:ED:4F:17
          inet addr:192.168.5.28  Bcast:192.168.5.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:434745 errors:0 dropped:0 overruns:0 frame:0
          TX packets:8451 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:73297381 (69.9 MiB)  TX bytes:706961 (690.3 KiB)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:608 errors:0 dropped:0 overruns:0 frame:0
          TX packets:608 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:86289 (84.2 KiB)  TX bytes:86289 (84.2 KiB)
```

`eht0` is your network interface connected to the network. It might have a different name
depending on the linux operating system you are using though.

`lo` is your loopback interface which just means it loops back to you (localhost).


#### Show sockets
To see socket statistics on your machine, use the `ss` command. 
Options of intrest:

* `ss -lp` - Shows all listening ports and the process listening
* `ss -t` Show all TCP sockets


### Process management 
* `top` - List running processes, or tasks
* `pkill <name>` - Sends SIGTERM to the specified process, matching the specified name. SIGTERM is a request for a graceful termination. 


### List Services

debian
```bash
service --status-all
```

centOS - excluding iptables so if the firewall has a long list it doesn't blind you.
```bash
for service in /etc/init.d/*; do if [[ $(basename $service) != "iptables" ]]; then sudo service $(basename $service) status | grep "is running"; fi; done
```
## Utilities


### Vim

Vim can be very daunting when first using it. It is the default editor in 
linux for many programs so you should know what to do if you are presented with vim
ex. `(crontab will default with vim when trying to edit the cron)`

To open a file with vim you can type `vim somefile.txt`. 

You are now in the editor and you will notice if you try to type something that it won't write.

This is because vim is listening for commands. In order to type in the text file you must turn it
to insert mode by pressing the `i` key.

Once you get done making your edits you will need to exit INSERT mode by pressing the `escape` key.

Now to save your edits you will need to access vim's command line. You can do this by pressing 
the `:` (colon) key. Now type `wq` and ENTER to write (w) and quit(q).

If you need to exit without saving the command is `q!`.

