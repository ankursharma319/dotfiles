
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# enable color support of ls and also add handy aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls -lsahF --color=auto'
alias ssh="ssh -o SendEnv=COLORTERM"

# https://ezprompt.net
# https://robotmoon.com/bash-prompt-generator/
export PS1="\[$(tput setaf 34)\]\u\[$(tput setaf 34)\]@\[$(tput setaf 34)\]\h: \[$(tput setaf 75)\]\w \[$(tput sgr0)\]$ "

# for nix-env utf-8 locale issues
# also make sure to install nix-env -ia nixpkgs_unstable.glibcLocales
# export LOCALE_ARCHIVE="$HOME/.nix-profile/lib/locale/locale-archive"

export CURRENT_EP=polaris-23.rd.cisco.com
allt() { ssh root@$CURRENT_EP 'tail -f /var/log/eventlog/all.log | grep -i -e macro -e cuil -e ankur'; }
allc() { ssh root@$CURRENT_EP 'cat /var/log/eventlog/all.log | grep -i -e macro -e cuil -e ankur -e lyra -e wx2 -e config'; }
ep () { ssh -t root@$CURRENT_EP "cd /var/log/eventlog; exec \$SHELL -l"; }
