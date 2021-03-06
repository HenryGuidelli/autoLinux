#!/bin/bash
echo "autoXampp Installer"

if [ -e /opt/autoLinux/autoXampp ]; then
	echo "PASTAS OK!"
else
	mkdir -p /opt/autoLinux/autoXampp
	echo "PASTAS OK!"
fi

cd //opt/
sudo chmod 777 autoLinux/autoXampp/ -R
cd /opt/autoLinux/autoXampp/


if [ -e /opt/autoLinux/autoXampp/xampp-linux-installer.run ]; then
	echo "INSTALLER OK!"
else
	sudo wget -O xampp-linux-installer.run https://downloadsapachefriends.global.ssl.fastly.net/8.1.6/xampp-linux-x64-8.1.6-0-installer.run?from_af=true
	echo "INSTALLER OK!"
fi

sudo chmod a+x xampp-linux-installer.run

if [ -e /opt/lampp/ ]; then
	echo "XAMPP OK!"
else
	sudo ./xampp-linux-installer.run
	echo "XAMPP OK!"
fi

cd /opt/lampp/ 
sudo chmod 777 htdocs -R 

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


cd //opt/
sudo chmod 777 autoLinux/autoXampp/ -R
