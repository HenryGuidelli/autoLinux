#!/bin/bash
clear
echo "autoXampp Installer"

echo "Deseja iniciar a instalação? [Y/N]"

read cond

if [cond == "y" -o "Y"]; then
	echo "Iniciando Intalação!"
else
	^C
fi

if [ -e /opt/autoLinux/autoXampp ]; then
	echo "PASTAS OK!"
else
	mkdir -p /opt/autoLinux/autoXampp
	echo "PASTAS OK!"
fi

sudo chmod 777 /opt/autoLinux/autoXampp/ -R

if [ -e /opt/autoLinux/autoXampp/xampp-linux-installer.run ]; then
	echo "INSTALLER OK!"
else
	sudo wget -P /opt/autoLinux/autoXampp/ https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.0/xampp-linux-x64-8.2.0-0-installer.run
	sudo mv /opt/autoLinux/autoXampp/xampp-linux-x64-8.2.0-0-installer.run /opt/autoLinux/autoXampp/xampp-linux-installer.run
	echo "INSTALLER OK!"
fi

sudo chmod a+x /opt/autoLinux/autoXampp/xampp-linux-installer.run

if [ -e /opt/lampp/ ]; then
	echo "XAMPP OK!"
else
	cd / && sudo ./opt/autoLinux/autoXampp/xampp-linux-installer.run
	echo "XAMPP OK!"
fi

sudo chmod 777 /opt/lampp/htdocs -R 

if [ -e /opt/autoLinux/autoXampp/autoXampp-Runner.sh ]; then
	echo "RUNNER OK!"
else
	sudo wget --convert-links -P /opt/autoLinux/autoXampp/ https://raw.githubusercontent.com/HenryGuidelli/autoLinux/main/autoXampp/autoXampp-Runner.sh
	echo "RUNNER OK!"
fi

if [ -e /opt/autoLinux/autoXampp/autoXampp-Runner.desktop ]; then
	echo "APPLICATION-OPT OK!"
else
	sudo wget --convert-links -P /opt/autoLinux/autoXampp/ https://raw.githubusercontent.com/HenryGuidelli/autoLinux/main/autoXampp/autoXampp-Runner.desktop
	echo "APPLICATION-OPT OK!"
fi

if [ -e /usr/share/applications/autoXampp-Runner.desktop ]; then
	echo "APPLICATION-USR OK!"
else
	sudo cp /opt/autoLinux/autoXampp/autoXampp-Runner.desktop /usr/share/applications/
	sudo chmod a+x /usr/share/applications/autoXampp-Runner.desktop
	echo "APPLICATION-USR OK!"
fi

if [ -e /opt/autoLinux/autoXampp/favicon.png ]; then
	echo "ICONE OK!"
else
	sudo wget -P /opt/autoLinux/autoXampp/ https://github.com/HenryGuidelli/autoLinux/raw/main/autoXampp/favicon.png
	echo "ICONE OK!"
fi

sudo chmod 777 /opt/autoLinux/autoXampp/ -R
