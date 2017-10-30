#!/bin/bash
sudo apt install python python-pip python-dev libffi-dev libssl-dev
sudo apt install python-virtualenv python-setuptools
sudo apt install libjpeg-dev zlib1g-dev swig
sudo apt install mongodb

echo "¿Quieres instalar VirtuaBox?[S/N]:"
read vbox
if (( (vbox=="S") )); then
    echo deb http://download.virtualbox.org/virtualbox/debian xenial contrib | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    sudo apt update
    sudo apt install virtualbox-5.1
fi

sudo apt install tcpdump apparmor-utils
sudo aa-disable /usr/sbin/tcpdump
sudo apt install tcpdump
sudo apt install libcap2-bin
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump

sudo apt install swig
sudo pip install m2crypto==0.24.0

sudo pip install -U pip setuptools
sudo pip install -U cuckoo

echo -e "---------------------------------------------------"
echo -e "|             Fin de la instalación               |"
echo -e "---------------------------------------------------"
