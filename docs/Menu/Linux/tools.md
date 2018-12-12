
## Linux Tools

### Defence 

#### RKhunter

RKhunter is a Linux rootkit and backdoor scanner avalible in most repos. It checks for known backdoors, wrong file permissions, and checksums some binaries.

To run all checks (requires root): `rkhunter --check`
By default, the output is logged at `/var/log/rkhunter.log`

See also: 

* [Techmint](https://www.tecmint.com/install-rootkit-hunter-scan-for-rootkits-backdoors-in-linux/)

* [SUSE Wiki](https://en.opensuse.org/Rootkit_Hunter)

#### UFW
UFW (Uncomplicated FireWall) is a simple frontend to the Linux kernel's iptables firewall. 
To enable the firewall: `ufw enable` **DANGER: By default, this will block ALL incoming traffic unless otherwise configured!**

To allow SSH: `ufw allow ssh` OR `ufw allow in 22/tcp`

In general, the syntax is `ufw allow|deny|reject in|out port|app/tcp|udp`

To list current rules: `ufw status verbose`

To deny an IP or range to all ports: `ufw deny from IP/CIDR`

See also:
[ArchWiki](https://wiki.archlinux.org/index.php/Uncomplicated_Firewall)

#### IPtables
IPtables is the Linux kernel's built in firewall. While more complex, it offers more features than a front-end and is found on all Linux systems. Please try to use UFW, detailed in the above section, if possible.

To view current IPtables rules: `iptables -nvL`

To give an example of output information, `Chain INPUT (policy ACCEPT 0 packets, 0 bytes)`
indicates that by default, all INPUT data (incoming) will be ACCEPTed. 

To change the Chain default: `iptables -P <CHAIN> <ACCEPT|REJECT|DROP>`

To allow SSH traffic over TCP port 22: `iptables -A INPUT -p tcp --dport 22 -j ACCEPT`

By default, rules are not preserved on system reboot.

See also:
[DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-iptables-on-ubuntu-14-04)

#### Whowatch
Whowatch is a realtime user and process monitor. It interactivly shows the output of the `w` command, and allows you to kill the users login and processes from the TUI.

To launch, use the command `whowatch`. While in the TUI, press `s` to view system info, or `t` to view the process tree.

See also: [TechMint](https://www.tecmint.com/whowatch-monitor-linux-users-and-processes-in-real-time/)

### Gathering information 

#### User information 

To see all logged in users, from where, and what they are doing, use the `w` command.

To list all user accounts on the system, see the `/etc/passwd` file. All users in the 'root' group or with UID 0, or named 'root' have superuser access.

Example:

`root:x:0:0:root:/root:/bin/bash` Is a superuser because the account is named root. It is also the superuser because it has user ID 0, and has group root. 

For more details on user entries, see [ArchWiki](https://wiki.archlinux.org/index.php/Users_and_groups#User_database).

Other user info commands:

* `last` - Displays login log for the system.
* `lastb` - Shows unsuccessful logins for the system.

#### Network


### Process management 

