#!/bin/bash

packageManger="apt-get"

echo "\nWelcome to STM32 Linux setup\n"

read -p "do you want to continue (y/n) ?: " yesorno
if [ "$yesorno" = "y" ];
then
	sudo apt install -y gcc-arm-none-eabi
	sudo apt install -y stlink-tools
	sudo apt install -y gdb
else 
    echo "aborted"
fi
