#!/usr/bin/env bash

set -e

echo This bash script will download and install the vim from http://github.com/ehzShelter/dotMethod.
read -p "Is that okay? [Yn] " confirm

# Transform to lower case
confirm=$(echo $confirm | tr [:upper:] [:lower:])

if [[ -n $confirm && $confirm != "y" && $confirm != "yes" ]]; then
  echo Please re-run this script in the home directories
  exit 1
fi

echo
echo Downloading and installing...
mkdir -p ~/.dotMethod

git clone https://github.com/ehzShelter/dotMethod.git ~/.dotMethod
echo Downloaded

cd ~/.dotMethod/appliance/

echo copying all dot file

cp bashrc ~/.bashrc
cp bash_profile ~/.bash_profile
cp git-completion.bash ~/.git-completion.bash
cp gvimrc ~/.gvimrc
cp gitignore ~/.gitignore
cp gitconfig ~/.gitconfig
cp jscsrc  ~/.jscsrc
cp jslintrc ~/.jslintrc
cp jshintrc ~/.jshintrc
cp profile ~/.profile
cp clang-format ~/.clang-format
cp tmux.conf ~/.tmux.conf
cp inputrc ~/.inputrc
cp npmrc ~/.npmrc

sudo cp Smyck.theme /usr/share/xfce4/terminal/colorschemes/

sudo chmod a+r /usr/share/xfce4/terminal/colorschemes/Smyck.theme

echo -e "\[\e[1;32m\]Everything succesfully installed.\[\e[0m\]"

echo -e "Now Downloading CS50 C library"

sudo su -

apt-get install gcc
wget http://mirror.cs50.net/library50/c/library50-c-5.zip
unzip library50-c-5.zip
rm -f library50-c-5.zip
cd library50-c-5
gcc -c -ggdb -std=c11 cs50.c -o cs50.o
ar rcs libcs50.a cs50.o
chmod 0644 cs50.h libcs50.a
mkdir -p /usr/local/include
chmod 0755 /usr/local/include
mv -f cs50.h /usr/local/include
mkdir -p /usr/local/lib
chmod 0755 /usr/local/lib
mv -f libcs50.a /usr/local/lib
cd ..
rm -rf library50-c-5

