#!/bin/bash
green="\033[0;32m"
plain="\033[0m"

# Checking wget
wget=/data/data/com.termux/files/usr/bin/wget
if [ ! -f "$wget" ]; then
apt update
apt upgrade -y
apt install wget -y
fi

# Download bin
printf "${plain}* Downloading bin..."
wget -qO ../usr/bin/enc "https://raw.githubusercontent.com/zyanv/encrypt/main/enc.sh"
chmod +x ../usr/bin/enc
printf " ${green}Done${plain}\n"
rm -rf setup.sh
echo -e "${plain}* Type ${green}enc ${plain}to run the command."
