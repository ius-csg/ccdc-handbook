# Ubuntu DNS

## BIND DNS

The Ubuntu server is likely running the BIND DNS server which will contain A and MX records for the other machines. The config file is located at `/etc/named.conf` 

Default ports:

53/tcp - DNS queries

???

* [DSAs for BIND](https://security-tracker.debian.org/tracker/source-package/bind)
* [Archwiki - BIND](https://wiki.archlinux.org/index.php/BIND)
* [BIND Ubunutu setup - DO](https://www.digitalocean.com/community/tutorials/how-to-configure-bind-as-a-private-network-dns-server-on-ubuntu-14-04)

## MySQL

A SQL server will also likely be present for use on the eCommerce/CentOS box. 
