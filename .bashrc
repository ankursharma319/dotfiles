
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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# for nix home manager
NIX_HM_VARS_FILE="$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
if [ -f $NIX_HM_VARS_FILE ]; then
    . "$NIX_HM_VARS_FILE"
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=4000

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
NIX_GLIBC_LOCALE_ARCHIVE_FILE="$HOME/.nix-profile/lib/locale/locale-archive"
if [ -f $NIX_GLIBC_LOCALE_ARCHIVE_FILE ]; then
    export LOCALE_ARCHIVE=$NIX_GLIBC_LOCALE_ARCHIVE_FILE
fi

export CURRENT_EP=polaris-23.rd.cisco.com
allt() { ssh root@$CURRENT_EP 'tail -f /var/log/eventlog/all.log | grep -i -e macro -e cuil -e ankur'; }
allc() { ssh root@$CURRENT_EP 'cat /var/log/eventlog/all.log | grep -i -e macro -e cuil -e ankur -e lyra -e wx2 -e config'; }
ep () { ssh -t root@$CURRENT_EP "cd /var/log/eventlog; exec \$SHELL -l"; }
