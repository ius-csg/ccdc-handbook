# Fedora Email

The Fedora 25 email server is  running the Postfix MTA (Mail Transfer Agent) for SMTP. This is usually done with TCP port 25 and TCP port 465. 

The Dovecot IMAP and POP3 server also could be running, which allows mail retrieval from a server. IMAP usually uses TCP 143 for unsecure connections, and 993 for IMAP over SSL. POP3 uses TCP 110 for unsecure connections, and TCP 995 for POP3 over SSL/TLS.

## Postfix
Postfix has literally hundreds of config options. These options are usually stored in the `/etc/postfix` directory. The `main.cf` files contains config options, and `master.cf` which specifies what services it should run. 

### Postconf
The command-line tool `postconf` is usually used to modify the `master.cf` file rather than editing it by hand. 

### Service management 
Postfix seems to do its own service management using the `postfix` command. 

### Hardening and DSAs

[CVEs for Postfix](https://www.cvedetails.com/vulnerability-list.php?vendor_id=8450&product_id=0&version_id=0&page=1&hasexp=0&opdos=0&opec=0&opov=0&opcsrf=0&opgpriv=0&opsqli=0&opxss=0&opdirt=0&opmemc=0&ophttprs=0&opbyp=0&opfileinc=0&opginf=0&cvssscoremin=0&cvssscoremax=0&year=0&cweid=0&order=1&trc=9&sha=35bd0db6eaf0ce6e6602815626646549104adcab)

### Links
* https://linux-audit.com/postfix-hardening-guide-for-security-and-privacy/

## Dovecot
Dovecot config files are stored in `/etc/dovecot/dovecot.conf` and `/etc/dovecot/conf.d/*`

### Hardening and DSAs

Don't put the `dovecot` user in the mail group! [Info](https://wiki1.dovecot.org/VirtualUsers)

* [CVEs for Dovecot](https://www.cvedetails.com/vulnerability-list.php?vendor_id=6485&product_id=0&version_id=0&page=1&hasexp=0&opdos=0&opec=0&opov=0&opcsrf=0&opgpriv=0&opsqli=0&opxss=0&opdirt=0&opmemc=0&ophttprs=0&opbyp=0&opfileinc=0&opginf=0&cvssscoremin=0&cvssscoremax=0&year=0&cweid=0&order=1&trc=37&sha=5fc3ca102d580ee204b181809c720eb094ff796b)
* [Fail2Ban Directions](https://wiki1.dovecot.org/HowTo/Fail2Ban)

## Users
Users are being pulled over LDAP from the Windows AD machine. 

## DNS
Mail servers usually require special A and MX records. 

## Resources 
* https://wiki.archlinux.org/index.php/Virtual_user_mail_system_with_Postfix,_Dovecot_and_Roundcube
* https://www.digitalocean.com/community/tutorials/how-to-set-up-a-postfix-e-mail-server-with-dovecot
