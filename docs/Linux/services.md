### Cron
Cron is a simple time based job scheduler. Cron configuation files (crontabs) can be configured for the system, and for indiviual users. User crontabs are usually located at `/var/spool/cron/crontab`. The position of system crontabs varies, but can usually be found under `/etc`.



To list the crontab of every user in the system:
```bash 
for user in $(sudo cut -f1 -d: /etc/passwd); do sudo crontab -u $user -l && echo ^$user; done
```

Or use the [Crontabs script](https://github.com/ius-csg/scripts/blob/master/linux/crontabs.sh) from the scripts repo.

For a default Install there is no crontabs set up. If there is any added it is because of two reasons:

* It's there for an application to function correctly

Or

* It's malicious intent.


If it's malicious intent then we should remove it from that user.

type `crontab -u [the-user-name] -e`. This will put you into a vim editor. It might be unfamiliar at first. This allows you to edit the crontab.

Or, use `crontab -u [USERNAME] -r` to completely remove it.

See also: 

* [DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-on-a-vps)
* [read about vim to know how to edit this text file](tools.md#vim)


### Apache 

* [mod-security](https://www.digitalocean.com/community/tutorials/how-to-set-up-mod_security-with-apache-on-debian-ubuntu) - sql injection defense


### PHP

* [PHP Hardening](https://www.owasp.org/index.php/PHP_Configuration_Cheat_Sheet) - disable command line execution functions
* [Patching PHP vulnerabilities](https://suhosin.org/stories/index.html)
