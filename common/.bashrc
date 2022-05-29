# Avoid problems when using non-interactive sessions
# See: https://serverfault.com/questions/304125/rsync-seems-incompatible-with-bashrc-causes-is-your-shell-clean
[[ $- != *i* ]] && return

# read proxy info
if [ -e $HOME/.proxy ]; then
   source $HOME/.proxy
fi

if [ -f ~/.shell_env ]; then
    source ~/.shell_env
fi

if [ -f ~/.shell_functions ]; then
    source ~/.shell_functions
fi

# fortune -a
#if [ -e ~/.git-completion.bash ]; then
#    source ~/.git-completion.bash
#fi

#if [[ -e ~/.git-prompt.sh ]]; then
#    source ~/.git-prompt.sh
#fi

if [[ 1==$INBASH ]] && [ -f $HOME/.git-completion.bash ]; then
    source $HOME/.git-completion.bash
fi

if [[ 1==$INBASH ]] && [ -f $HOME/.git-prompt.sh ]; then
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_HIDE_IF_PWD_IGNORED=true
    GIT_PS1_SHOWCOLORHINTS=true
    source $HOME/.git-prompt.sh    .
fi


if [ 1 -eq $INBASH ] && [ -f ~/.bash_utils ]; then
    . ~/.bash_utils
fi

# # From https://opensource.com/article/18/9/shell-dotfile
# if [[ `egrep '168.176|17.42' /etc/resolv.conf` ]]; then
#     if [ -e $HOME/.work ]; then
# 	source $HOME/.work
#     else
#         echo "This looks like a work machine, but I can't find the ~/.work file"
#     fi
# fi

# # spack
# fname=$HOME/repos/spack/share/spack/setup-env.sh
# if [ -f $fname ]; then
#     source $fname # for macosx
# fi


## ohmybash or bashit
#source ~/.bashrc-ohmybash-config
#source ~/.bashrc-bashit

## conda
if [ 1 -eq $INBASH ]; then
    source ~/.bashrc-conda
fi


if [ 1 -eq $INBASH ]; then
    #########################
    # PS1
    #########################
    #export PS1="\[\e[36m\]\u@\[\e[33m\]\h \[\e[32m\]\W/ \[\e[91m\]\$(parse_git_branch)\[\e[00m\] $ "
    #export PS1="\[\e[0;35m\][ \t ] \[\e[1;37m\]\u@\[\e[1;36m\]\h \[\e[00m\] \[\e[0;32m\]\W/ \[\e[0:37m\]\$(parse_git_branch)\[\e[00m\] "
    export ORIG_PS1="\[\e[0;35m\][ \t ] \[\e[1;37m\]\u@\[\e[1;36m\]\h \[\e[00m\] \[\e[0;32m\]\W/\[\e[00m\] "
    # ##export PS1="\[\033[1;37m\][\[\033[1;32m\]\u\[\033[1;37m\]@\[\033[1;37m\]\h\[\033[1;37m\]] \[\033[1;36m\]\w \[\033[1;33m\]\$\[\033[0m\] "
    # ##export PS1='\[\e[1;32m\]\h:\[\e[m\]\[\e[1;30m\]\W\[\e[m\] \[\e[1;34m\]\u\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
    # ##export PS1='\[\e[1;32m\]\u\[\e[m\]@\[\e[1;33m\]\h\[\e[m\] \[\e[1;34m\]\w/\[\e[m\]\[\e[1;32m\]\[\e[m\]\n\[\e[1;32m\]$ \[\e[m\]'
    # #export PS1='\[\e[1;32m\]\u\[\e[m\]@\[\e[1;33m\]\h\[\e[m\] \[\e[1;34m\]\w/\[\e[m\]\[\e[1;32m\]\[\e[m\]\n\[\e[1;32m\]$(__git_ps1 "(%s)") $ \[\e[m\]'
    # export PS1='\[\e[1;32m\]\u\[\e[m\]@\[\e[1;33m\]\h-$IP\[\e[m\] \[\e[1;34m\]\w/\[\e[m\]\[\e[1;32m\]\[\e[m\]\n\[\e[1;32m\]$(__git_ps1 "(%s)") $ \[\e[m\]'
    # ##export PROMPT_COMMAND="echo; date; $PROMPT_COMMAND"
    #export PROMPT_COMMAND="echo; date; history -a"
    #PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
    #PROMPT_COMMAND="set_ps1; $PROMTP_COMMAND"
    if [[ "function" == "$(type -t __git_ps1)" ]]; then
        export PROMPT_COMMAND='__git_ps1 "${CONDA_PROMPT_MODIFIER}${ORIG_PS1}" "\n\\[\033[00m\]\$ "'
    else
        export PS1=${CONDA_PROMPT_MODIFIER}${ORIG_PS1}" \[\e[0:37m\]\$(parse_git_branch)\n\\[\033[00m\]\$ "
    fi
fi

#source ~/.config/broot/launcher/bash/br
