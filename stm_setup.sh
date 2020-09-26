#!/bin/bash

packageManger="apt-get"


echo "\nWelcome to STM32 Linux setup\n"

read -p "do you want to continue (y/n) ?: " yesorno
if [ "$yesorno" = "y" ];
then
	sudo apt install -y gcc-arm-none-eabi
	sudo apt install -y stlink-tools
	sudo apt install -y gdb
	mkdir stmcube
	echo "you will be redirected to the download site of ST please donwload the file and place it on the stmcube directory" 
	sensible-browser https://my.st.com/content/my_st_com/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-configurators-and-code-generators/stm32cubemx.license=1601130472038.product=STM32CubeMX.version=6.0.1.html
	sudo unzip stmcube/*.zip
	sudo chmod +x stmcube/SetupSTM32CubeMX-6.0.1.linux
	./stmcube/SetupSTM32CubeMX-6.0.1.linux

	echo "do you want to perform st-util --probe ?"
	read -p 

	read -p "do you want to perform st-info --probe (y/n) ?: " yesorno
	if [ "$yesorno" = "y" ]; then
		st-info --probe
	fi
else 
    echo "aborted"
fi
