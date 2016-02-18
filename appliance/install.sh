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

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "prefix I for installing tmux plugin"

if [ -d "/usr/share/xfce4/terminal/" ]
then
sudo cp Smyck.theme /usr/share/xfce4/terminal/colorschemes/

sudo chmod a+r /usr/share/xfce4/terminal/colorschemes/Smyck.theme
else
    echo " Sorry you are not using xfce"
fi

echo -e "\[\e[1;32m\]Everything succesfully installed.\[\e[0m\]"
