
## Tools

### RKhunter

RKhunter is a Linux rootkit and backdoor scanner avalible in most repos. It checks for known backdoors, wrong file permissions, and checksums some binaries.

To run all checks (requires root): `rkhunter --check`
By default, the output is logged at `/var/log/rkhunter.log`

See also: 
* [Techmint](https://www.tecmint.com/install-rootkit-hunter-scan-for-rootkits-backdoors-in-linux/)
* [SUSE Wiki](https://en.opensuse.org/Rootkit_Hunter)

### UFW
UFW (Uncomplicated FireWall) is a simple frontend to the Linux kernel's iptables firewall. 
To enable the firewall: `ufw enable` **DANGER: By default, this will block ALL incoming traffic unless otherwise configured!**

To allow SSH: `ufw allow ssh` OR `ufw allow in 22/tcp`

In general, the syntax is `ufw allow|deny|reject in|out port|app/tcp|udp`

To list current rules: `ufw status verbose`

To deny an IP or range to all ports: `ufw deny from IP/CIDR`
