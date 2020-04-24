if [ -r ~/.profile ]; then
    . ~/.profile;
fi
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

export PATH=$PATH:/Users/oquendo/.local/bin
# if [ -f `which powerline-daemon` ]; then
#     powerline-daemon -q
#     POWERLINE_BASH_CONTINUATION=1
#     POWERLINE_BASH_SELECT=1
#     source /Users/oquendo/.local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
# fi
