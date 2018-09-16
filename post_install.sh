#!/bin/sh

ln -s /usr/local/bin/mono /usr/bin/mono
fetch https://github.com/Jackett/Jackett/releases/download/v0.9.23/Jackett.Binaries.Mono.tar.gz -o /usr/local/share
tar -xzvf /usr/local/share/Jackett.Binaries.Mono.tar.gz -C /usr/local/share
rm /usr/local/share/Jackett.Binaries.Mono.tar.gz
pw user add jackett -c jackett -u 818 -d /nonexistent -s /usr/bin/nologin
mkdir /usr/local/jackett
chown -R jackett:jackett /usr/local/share/Jackett /usr/local/jackett
mkdir /usr/local/etc/rc.d

chmod u+x /usr/local/etc/rc.d/jackett
sysrc "jackett_enable=YES"
service jackett restart
