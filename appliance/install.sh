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

git clone https://github.com/ehzShelter/vimMethod ~/.dotMethod

cd ~/.dotMethod/appliance/

cp bashrc ~/.bashrc
cp bash_profile ~/.bash_profile
cp git-completion.bash ~/.git-completion.bash
cp gvimrc ~/.gvimrc
cp gitignore ~/.gitignore
cp gitconfig ~/.gitconfig


echo -e "\[\e[1;32m\]Everything succesfully installed.\[\e[0m\]"

