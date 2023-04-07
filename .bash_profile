
source ~/.bashrc

# append to the history file, don't overwrite it
shopt -s histappend

# use keychain to make sure only one ssh-agent
# is running across all shells and set appropriate env vars
# so that ssh-add and other cmds can find the ssh-agent
if command -v keychain &> /dev/null
then
    eval `keychain --eval --agents ssh`
    # keychain --timeout 666666 id_rsa
    # to add can use that instead of
    # ssh-add -t 666666 ~/.ssh/id_rsa
fi

