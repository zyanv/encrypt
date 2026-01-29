#!/bin/bash
plain="\033[0m"
red="\033[0;31m"
green="\033[0;32m"

# Directory
dir=$(pwd)

# Checking package
enc=/storage/emulated/0/Download
if [ ! -f "$enc" ]; then
	sleep 0.5
	echo -e "${red}Obfuscate package not found!"
	sleep 1
	echo -e "${plain}Installing Package..."
	sleep 1
	apt update
	apt upgrade -y
	apt install nodejs -y
	npm -g install bash-obfuscate
fi

# Banner
Banner(){
clear
sleep 0.1
echo -e "┏┓ ┏━┓┏━┓╻ ╻   ┏━╸┏┓╻┏━╸┏━┓╻ ╻┏━┓╺┳╸┏━╸┏━┓"
sleep 0.3
echo -e "┣┻┓┣━┫┗━┓┣━┫╺━╸┣╸ ┃┗┫┃  ┣┳┛┗┳┛┣━┛ ┃ ┣╸ ┣┳┛"
sleep 0.3
echo -e "┗━┛╹ ╹┗━┛╹ ╹   ┗━╸╹ ╹┗━╸╹┗╸ ╹ ╹   ╹ ┗━╸╹┗╸"
sleep 0.3
echo -e "              ${green}v1.0 by ZyanV"
sleep 1
}

# Menu
Menu(){
Banner
printf "${plain}"
echo -e " 1) Encrypt"
echo -e " 2) Decrypt"
echo -e " x) Exit"
read -p $'\nSelect option: ' menu
if [ $menu = 1 ]; then
	sleep 1
	File
	Enc

elif [ $menu = 2 ]; then
	sleep 1
	File
	Dec

elif [ $menu = x ]; then
	sleep 0.5
	echo
	exit 1

else
	echo
	sleep 0.2
	echo -e " ${red}Wrong input!${plain}"
	sleep 1
	Menu

fi
}

# Input Output File
File(){
read -p $'\n * Input file: ' file
sleep 0.1
read -p $' * Save as: ' out
}

# Encode
Enc(){
sleep 1
echo -e " * Encrypting..."
bash-obfuscate $dir/$file -o $dir/$out
echo -e " ✓ Saved: ${green}$out${plain}\n"
}

# Decode
Dec(){
sleep 1
echo -e " * Decrypting..."
if [ ! -d "$dir/.tmp" ]; then
	mkdir $dir/.tmp
fi
cp -f $dir/$file $dir/.tmp/$out.tmp
sed -i 's/eval/echo/g' $dir/.tmp/$out.tmp
dec=$(bash $dir/.tmp/$out.tmp)
echo -e "$dec" >> $dir/$out
echo -e " ✓ Saved: ${green}$out${plain}\n"
rm -rf .tmp
}

Menu
