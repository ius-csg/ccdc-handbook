# Ubuntu DNS

## Unbound DNS

The Ubuntu server is likely running the Unbound DNS server which will contain A and MX records for the other machines. 
Unbound can be controlled remotely with the `unbound-control` utility which must be configured before use. 
The config file for Unbound can be found in `/etc/unbound/unbound.conf`

Default ports:

8953/tcp - Remote control port

53/tcp - DNS queries

* [DSAs for Unbound](https://security-tracker.debian.org/tracker/source-package/unbound)
* [Config manual](https://manpages.ubuntu.com/manpages/precise/man5/unbound.conf.5.html)

## MySQL

A SQL server will also likely be present for use on the eCommerce/CentOS box. 
