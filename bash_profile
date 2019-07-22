eval $(ssh-agent) &>/dev/null
ssh-add &>/dev/null
export SSH_AUTH_SOCK

# source .bashrc only if this is a VT or SSH connection

if [ $(env | grep -c SSH_CONNECTION) -ne 0 ] || [ $TERM = "linux" ]; then
    source ~/.bashrc
fi

if [ "$TERM" != "linux" ]; then
    source ~/pureline/pureline ~/.pureline.conf
fi
