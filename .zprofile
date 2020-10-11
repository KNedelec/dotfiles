
# Path to your oh-my-zsh installation.
export ZSH="/Users/knedelec/.oh-my-zsh"
export PRIVATE_PATH=~/.private/.zprofile

if test -f $PRIVATE_PATH; then
  source $PRIVATE_PATH
fi

export EDITOR=vim
export BROWSER=firefox
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PYENV_ROOT=~/.pyenv

eval "$(pyenv init -)"

export HEROKU_AC_ZSH_SETUP_PATH=/Users/knedelec/Library/Caches/heroku/autocomplete/zsh_setup
export PATH=$PATH:/users/knedelec/scripts
