### Cron
Cron is a simple time based job scheduler. Cron configuration files (crontabs) can be configured for the system, and for individual users. User crontabs are usually located at `/var/spool/cron/crontab`. The position of system crontabs varies, but can usually be found under `/etc`.

It's usually best to stop cron on the entire system using systemd, or sysvinit. 

See also: 

* [DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-on-a-vps)


### Apache 

* [mod-security](https://www.digitalocean.com/community/tutorials/how-to-set-up-mod_security-with-apache-on-debian-ubuntu) - sql injection defense


### PHP

* [PHP Hardening](https://www.owasp.org/index.php/PHP_Configuration_Cheat_Sheet) - disable command line execution functions
* [Patching PHP vulnerabilities](https://suhosin.org/stories/index.html)
