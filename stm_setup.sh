#!/bin/bash

packageManger="apt-get"

echo "\nWelcome to STM32 Linux setup\n"

read -p "do you want to continue (y/n) ?: " yesorno
if [ "$yesorno" = "y" ];
then
	sudo apt install -y gcc-arm-none-eabi
	sudo apt install -y stlink-tools
	sudo apt install -y gdb
	cd test 
	make clean 
	make

	echo "do you want to perform st-util --probe ?"
	read -p 

	read -p "do you want to perform st-util --probe (y/n) ?: " yesorno
	if [ "$yesorno" = "y" ]; then
		st-util --probe
	fi
else 
    echo "aborted"
fi
