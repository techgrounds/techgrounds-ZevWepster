#!/bin/bash
sudo su
apt update
apt install apache2 -y
ufw allow 'Apache'
systemctl enable apache2
echo \<center\>\<h1\>Welcome to this AMAZING empty page!\</h1\>\<br/\>\</center\> > /var/www/html/index.html
systemctl restart apache2