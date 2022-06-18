#!/bin/bash

sudo user &> /dev/null

nome="zenity"
pacote=$(dpkg --get-selections | grep "$nome") 

echo
echo "verificando pacote gráfico ZENITY..."
echo

sleep 1

if [ -n "$pacote" ]; then
     echo "Pacote $nome já instalado"
     echo
else
     echo "Pacote $nome necessario não instalado"
     echo
     echo "Instalando Automaticamente Pacote ZENITY..."
     echo
     sudo apt install $nome -y &> /dev/null && echo "pacote gráfico instalado"
     echo
     
fi

zenity --title "AutoXampp" --question --text "Realmente quer installar o Xampp?" --no-wrap --ok-label "Sim" --cancel-label "Não"

( echo "autoXampp Installer"

sleep 0.8
echo 5

if [ -e /opt/autoLinux/autoXampp ]; then
	echo "PASTAS OK!"
else
	mkdir -p /opt/autoLinux/autoXampp
	echo "PASTAS OK!"
fi

sleep 0.5

cd //opt/
sudo chmod 777 autoLinux/autoXampp/ -R
cd /opt/autoLinux/autoXampp/


if [ -e /opt/autoLinux/autoXampp/xampp-linux-installer.run ]; then
	echo 25 "INSTALLER OK!"
else
	sudo wget -O xampp-linux-installer.run https://downloadsapachefriends.global.ssl.fastly.net/8.1.6/xampp-linux-x64-8.1.6-0-installer.run?from_af=true &> /dev/null
	echo 25 "INSTALLER OK!"
fi

sleep 0.5

sudo chmod a+x xampp-linux-installer.run

if [ -e /opt/lampp/ ]; then
	echo 30 "XAMPP OK!"
else
	sudo ./xampp-linux-installer.run
	echo 30 "XAMPP OK!"
fi

cd /opt/lampp/ 
sudo chmod 777 htdocs -R 

sleep 0.5

if [ -e /opt/autoLinux/autoXampp/autoXampp-Runner.sh ]; then
	echo 45 "RUNNER OK!"
else
	sudo wget --convert-links -P /opt/autoLinux/autoXampp/ https://raw.githubusercontent.com/HenryGuidelli/autoLinux/main/autoXampp/autoXampp-Runner.sh &> /dev/null
	echo 45 "RUNNER OK!"
fi

sleep 0.5

if [ -e /opt/autoLinux/autoXampp/autoXampp-Runner.desktop ]; then
	echo 55 "APPLICATION-OPT OK!"
else
	sudo wget --convert-links -P /opt/autoLinux/autoXampp/ https://raw.githubusercontent.com/HenryGuidelli/autoLinux/main/autoXampp/autoXampp-Runner.desktop &> /dev/null
	echo 55 "APPLICATION-OPT OK!"
fi

sleep 0.5

if [ -e /usr/share/applications/autoXampp-Runner.desktop ]; then
	echo 65 "APPLICATION-USR OK!"
else
	sudo cp /opt/autoLinux/autoXampp/autoXampp-Runner.desktop /usr/share/applications/
	sudo chmod a+x /usr/share/applications/autoXampp-Runner.desktop
	echo 65 "APPLICATION-USR OK!"
fi

sleep 0.5

if [ -e /opt/autoLinux/autoXampp/favicon.png ]; then
	echo 75 "ICONE OK!"
else
	sudo wget -P /opt/autoLinux/autoXampp/ https://github.com/HenryGuidelli/autoLinux/raw/main/autoXampp/favicon.png &> /dev/null
	echo 75 "ICONE OK!"
fi

echo 85

sleep 0.5

cd //opt/
sudo chmod 777 autoLinux/autoXampp/ -R

echo 100

sleep 5 ) | zenity --width=250 --height=100 --title "autoXampp" --progress

exit
