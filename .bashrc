# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

source /opt/homebrew/etc/bash_completion.d/git-prompt.sh
source /opt/homebrew/etc/bash_completion.d/git-completion.bash
source /opt/homebrew/etc/bash_completion

PS1='${debian_chroot:+($debian_chroot)}'
PS1+='\[\033[01;32m\]\u@\h\[\033[00m\]:'
PS1+='\[\033[01;34m\]\w\[\033[00m\]'
PS1+='$(__git_ps1 ">")'
PS1+='\[\033[01;35m\]$(__git_ps1 "[%s]")\[\033[00m\]'
PS1+='\[\033[01;32m\]\$\[\033[00m\] '

unset color_prompt force_color_prompt

# MAC OS COLOR LS
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


### ALIAS DUMP
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# some more ls aliases
alias ls='eza -l'
alias ll='eza -a'
alias la='eza -a'
alias l='eza -l'

### screen killer
killd () {
    for session in $(screen -ls | grep -o '[0-9]\{4\}')
    do
        screen -S "${session}" -X quit;
    done
}

### DIRSTACK
export MAX_DIR_STACK_SIZE=20
function cd {
    if (("$#" > 0)); then
        if [ "$1" == "-" ]; then
            popd > /dev/null
        else
            pushd "$@" > /dev/null
            EXISTING=`dirs -l -v | grep " ${PWD}\$" | egrep -o "^\s*[1-9][0-9]*" | sort -nr`
            for NUM in $EXISTING; do
                NUM=`echo "$NUM" | tr -d ' '`
                popd -n +$NUM >/dev/null || return $?
            done
            if [ "$MAX_DIR_STACK_SIZE" ]; then
                COUNT=`dirs -l -v -0 | awk '{print $1}'`
                while [ "$COUNT" -gt "$MAX_DIR_STACK_SIZE" ]; do
                    popd -n -0 >/dev/null || return $?
                    COUNT=$(( $COUNT - 1 ))
                done
            fi
        fi
    else
        cd $HOME
    fi
}
alias d='dirs -v'




### CUSTOM ENV
# PYTHON STARTUP
export PYTHONSTARTUP=$HOME/.pythonrc

# GOLANG
#export GOROOT=/usr/local/opt/go/libexec
#PATH=$GOROOT/bin:$PATH
#export GOPATH=$HOME/Core/go
#export GOBIN=$HOME/Core/go

### PATH SECTION
#sbin
PATH=/usr/local/sbin:$PATH
# ANDROID
#PATH=/$HOME/Library/Android/sdk/platform-tools:$PATH
#PATH=/$HOME/Library/Android/sdk/tools:$PATH
# JAVA STUFF
#PATH=/opt/jd-gui/:$PATH
#PATH=/opt/luyten/:$PATH
#PATH=/opt/bytecodeviewer/:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
