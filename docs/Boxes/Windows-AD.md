# Windows 2008R2 AD
The Windows AD server provides a DNS service, LDAP, and Windows domain service. 
At start, the Windows 8 workstation is joined to its domain and the initial credentials provided by CCDC are domain credentials. 

As only the DNS service is scored directly, a firewall is usually the most effective way to secure this server. While LDAP is used by the [Fedora Mailserver](Fedora-Email.md), disabling it has shown no ill effects in the past. 
This may be because the credentials are cached on the mailserver itself. 

It also also worth noting that Windows Update is broken on this server.
## Ports expected & firewall setup
Denying all inbound traffic except DNS is usually effective. 
## Setting a password policy 

## IPS/IDS

## Domain firewall settings

## Useful GPO options
Use `gpupdate /force` to apply group policy changes after updates. 

## Useful registry changes 