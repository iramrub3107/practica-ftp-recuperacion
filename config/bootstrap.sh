#!/bin/bash

apt-get update
apt-get upgrade -y
apt-get install -y bind9 bind9-dnsutils bind9-doc
cp /vagrant/config/resolv.conf /etc/resolv.conf
cp /vagrant/config/named /etc/default
cp /vagrant/config/named.conf.options /etc/bind
cp /vagrant/config/named.conf.local /etc/bind
cp /vagrant/config/izanramos.com.dns /etc/bind
cp /vagrant/config/izanramos.com.rev /etc/bind
service named restart
service bind9 restart

apt-get install -y vsftpd

useradd -m luis
echo -e "luis\nluis" | passwd luis
useradd -m maria
echo -e "maria\nmaria" | passwd maria
useradd -m miguel
echo -e "miguel\nmiguel" | passwd miguel
touch /home/luis/luis{1,2}.txt
chown luis:luis /home/luis/luis*.txt
touch /home/maria/maria{1,2}.txt
chown maria:maria /home/maria/maria*.txt
touch /home/miguel/miguel{1,2}.txt
chown miguel:miguel /home/miguel/miguel*.txt

cp /vagrant/config/vsftpd.conf /etc/vsftpd.conf
touch /srv/ftp/anonimos.txt
cp /vagrant/config/.message /srv/ftp/.message
cp /vagrant/config/vsftpd.chroot /etc/vsftpd.chroot
chown root:root /etc/vsftpd.chroot
chown root:root /etc/vsftpd.conf
chmod 644 /etc/vsftpd.conf
chmod 644 /etc/vsftpd.chroot
chown ftp:ftp /srv/ftp/.message
chown ftp:ftp /srv/ftp/anonimos.txt

cd /etc/ssl/certs
echo -e "ES\nGranada\nGranada\n\n\nftp.izanramos.com\nddommor600@ieszaidinvergeles.org" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/izanramos.com.pem -out /etc/ssl/certs/izanramos.com.pem

service vsftpd restart