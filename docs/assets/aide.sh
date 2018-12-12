#!/bin/bash
# Installs AIDE on the current Linux system using package management
# Must be run as root
if [ -e /usr/bin/apt-get ]; then #Check path for APT later
    apt-get install aide -y
    elif [ -e /usr/bin/yum ]; then #CentOS
    yum -y install aide
    elif [ -e /usr/bin/dnf ]; then #Fedora
    dnf -y install aide
else
    echo "Unknown OS, you are on your own. Good luck."
    exit 1
fi

# Setup config and run
chattr +i /etc/aide.conf
chmod 444 /etc/aide.conf
md5sum /etc/aide.conf > $confsum
echo "The MD5sum for the aide.conf file is ${confsum}"
echo "You may want to write that down"
if [  ! -e /var/lib/aide/aide.db.gz ]; then
    aide --init
    mv -vf /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
fi
echo "Running checks..."
while :
do
    aide --check
    sleep 90
    if [ $confsum != md5sum /etc/aide.conf ]; then
        echo "The AIDE config file has been modified! You're in trouble."
        exit 2
    fi
done
