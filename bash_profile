
# configure clang++
export CXX=clang++
export CXXFLAGS="-ggdb3 -O0 -std=c++11 -stdlib=libstdc++ -pedantic-errors -Wextra-tokens -Wambiguous-member-template -Wbind-to-temporary-copy -fdiagnostics-show-template-tree -ferror-limit=33 -ftemplate-backtrace-limit=13 -lpthread -l:libmagic.so.1"

# Custom aliases folder dir
alias author="cd ~/Dropbox/FUNProgramming/ehz_notebook"
alias github="cd ~/Dropbox/FUNProgramming/"
alias apublic="cd ~/vhosts/localhost/public/"

# my nootbook
alias ehz="vim ~/Dropbox/FUNProgramming/ehz_notebook/ehzNOTEBOOK.txt"

# My aliases
alias v="vim"
alias t="tmux"
alias vinp="vim --noplugin"
alias c="clear"

# Updating process
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias dist-upgrade='sudo apt-get dist-upgrade'

# all at once
alias pullall='update ; upgrade ; time dist-upgrade'

# git command aliases
alias gita="git add"
alias gitc="git commit"
alias gits="git status"
alias gitl="git log"
alias gitush="git push origin master"
alias gitull="git pull origin master"

# custom configuration

# If not running interactively, don't do anything else
[ -z "$PS1" ] && return

# configure prompt
if [ "$PS1" ]; then
  export PS1="\[\e[0;32m\]\u@\[\e[0;33m\]\h\[\e[0;34m\](\w):\[\e[0m\] "
fi

# if not root
if [ "$(id -u)" != "0" ]; then
  # set umask
  umask 0077

  # configure clang
  export CC=clang
  export CFLAGS="-ggdb3 -O0 -std=c11 -Wall -Werror -pedantic-errors"
  export LDLIBS="-lcs50 -lm"

  # configure man
  export MANSECT="3,2,1"

  # protect user
  alias cp="cp -i"
  alias mv="mv -i"
  alias rm="rm -i"

  # convenience
  alias ll="ls -l --color=auto"
  alias gdb="gdb -q"

  # allow core dumps
  ulimit -c unlimited

fi

# set editor
export EDITOR=vim

# set locale
export LANG=C

# Node.js
export NODE_ENV=dev

# SPL for pset3
export CLASSPATH=.:/usr/lib/spl.jar

# linking personalized ~/.bash_profile with ~/.bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi


