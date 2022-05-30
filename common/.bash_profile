if [ -r ~/.profile ]; then
    . ~/.profile;
fi
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac


#source ~/.config/broot/launcher/bash/br

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/oquendo/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/oquendo/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/oquendo/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/oquendo/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

