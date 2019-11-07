if [ -r ~/.profile ]; then
    . ~/.profile;
fi
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

# added by Miniconda3 4.7.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/oquendo/opt/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/oquendo/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/oquendo/opt/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/oquendo/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
