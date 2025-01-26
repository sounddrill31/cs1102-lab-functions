# aliases, for convenience, add to end of ~/.bashrc
alias "bc"="batcat"
alias "t"="tmux"

submit()
{
        if [ -z "$1" ]; then
                ARGS="script.sh"
        else
                ARGS=$1
        fi
        chmod +x $ARGS
        synchro eval
}
alias show="synchro show"
alias initial="synchro init"
mkqn() {
        if [ -d "/opt/cs1102/$1" ]; then
        echo "/opt/cs1102/$1 found! Making ~/cs1102/$1"
        mkdir -p ~/cs1102/$1
        cd ~/cs1102/$1
        synchro init
        if [ -f "/opt/cs1102/$1/init.sh" ];then
                echo "Showing problem description"
                synchro show
        fi
        else
        echo "/opt/cs1102/$1 not found!"
        fi
}
alias status="synchro status"
