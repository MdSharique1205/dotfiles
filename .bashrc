# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export COWPATH=/usr/share/cowsay/cows
export PATH=/home/fallacy/.local/share/Steam/compatibilitytools.d/SteamTinkerLaunch:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

# For fzf initialisation
eval "$(fzf --bash)"

source ~/.bash_env
source ~/.bash_aliases
source ~/.bash_startup_tasks
source /usr/share/nvm/init-nvm.sh
