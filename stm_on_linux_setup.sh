#!/bin/bash

packageManger="apt-get"

echo "Wellcome to my configuration file"
echo "using package manager: $packageManger"

read -p "do you want to continue (y/n) ?: " yesorno

if [ "$yesorno" = "y" ];
then

    echo "updating system..."
    sudo $packageManger update
    sudo $packageManger upgrade
    echo "...done!"


    echo "installing GCC, G++ cross compilers and support programs..."
    sudo $packageManager install libc6-armel-cross libc6-dev-armel-cross binutils-arm-linux-gnueabi libncurses5-dev build-essential bison flex libssl-dev bc 
    echo "...Done!"

    echo "installing gcc-arm-none-eabi..."
    sudo $packageManager install gcc-arm-none-eabi
    echo "...done!"

    echo "installing binutils-arm-none-eabi"
    sudo $packageManager install binutils-arm-none-eabi
    echo "...done!"

    echo "insatalling libnewlib-arm-none-eabi"
    sudo $packageManager install libnewlib-arm-none-eabi
    echo "...done!"

    echo "system configuration completed!"
    echo "now smile :)"
else 
    echo "aborted"
fi
