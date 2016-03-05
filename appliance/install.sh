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

echo "hym"
echo Downloading and installing...


if [ -d ~/.dotMethod ]
then
    echo "~/.dotMethod already exists"
    echo "so removing......................"
    rm -rf ~/.dotMethod
fi

git clone https://github.com/ehzShelter/dotMethod.git ~/.dotMethod
echo Downloaded

cd ~/.dotMethod/appliance/

echo symbolic linking all dot file

ln -fs .dotMethod/appliance/git-completion.bash ~/.git-completion.bash
ln -fs .dotMethod/appliance/gvimrc ~/.gvimrc
ln -fs .dotMethod/appliance/gitconfig ~/.gitconfig
ln -fs .dotMethod/appliance/jscsrc  ~/.jscsrc
ln -fs .dotMethod/appliance/jslintrc ~/.jslintrc
ln -fs .dotMethod/appliance/jshintrc ~/.jshintrc
ln -fs .dotMethod/appliance/profile ~/.profile
ln -fs .dotMethod/appliance/clang-format ~/.clang-format
ln -fs .dotMethod/appliance/tmux.conf ~/.tmux.conf
ln -fs .dotMethod/appliance/inputrc ~/.inputrc
ln -fs .dotMethod/appliance/npmrc ~/.npmrc
ln -fs .dotMethod/appliance/json-compilation-databse ~/.json-compilation-databse
ln -fs .dotMethod/appliance/tern-project ~/.tern-project
ln -fs .dotMethod/appliance/gitignore_global  ~/.gitignore_global
ln -fs .dotMethod/appliance/bash_profile ~/.bash_profile
ln -fs .dotMethod/appliance/bashrc ~/.bashrc
ln -fs .dotMethod/appliance/tmux.conf ~/.tmux.conf

mkdir -p ~/.npm-packages

if [ -d ~/.tmux/plugins ]
then
    echo "Tmux exits"
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


echo "prefix I for installing tmux plugin"

if [ -d /usr/share/xfce4/terminal/ ]
then
    sudo cp Smyck.theme /usr/share/xfce4/terminal/colorschemes/

    sudo chmod a+r /usr/share/xfce4/terminal/colorschemes/Smyck.theme
else
    echo " Sorry you are not using xfce"
fi


echo -e "\[\e[1;32m\]Everything succesfully installed.\[\e[0m\]"
