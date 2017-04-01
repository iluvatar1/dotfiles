if [ -f $HOME/proxy ]; then 
   source $HOME/.proxy
fi

fortune -a

# Detect os
# From : https://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='darwin'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    platform='freebsd'
fi

# Mac Os X only commands
if [[ $platform == 'darwin' ]]; then
    #archey | lolcat
    # the fuck, requires python 2
    #eval "$(thefuck --alias)"
    # HOMEBREW CASK
    # Specify your defaults in this environment variable
    export HOMEBREW_CASK_OPTS="--appdir=/Applications "
    # homebrew path
    PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
    export PATH
    # completion
    # git
    source /usr/local/etc/bash_completion.d/git-completion.bash
    source /usr/local/etc/bash_completion.d/git-prompt.sh
    # THIS IS ONE IS GIVING AN ERROR
    #if [ -f `brew --prefix`/etc/bash_completion ]; then
    #    . `brew --prefix`/etc/bash_completion
    #fi
    # fasd
    alias a='fasd -a'        # any
    alias s='fasd -si'       # show / search / select
    alias d='fasd -d'        # directory
    alias f='fasd -f'        # file
    alias sd='fasd -sid'     # interactive directory selection
    alias sf='fasd -sif'     # interactive file selection
    alias z='fasd_cd -d'     # cd, same functionality as j in autojump
    alias zz='fasd_cd -d -i' # cd with interactive selection
    fasd_cache="$HOME/.fasd-init-bash"
    if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
	fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
    fi
    source "$fasd_cache"
    unset fasd_cache
    alias open="reattach-to-user-namespace open"
    alias xpdf="open -a preview "
    alias todo="todo.sh -d ~/Dropbox/TODO/todo-txt/todo.cfg"
    alias t="todo.sh -d ~/Dropbox/TODO/todo-txt/todo.cfg"
    alias aquamacs='open -b org.gnu.Aquamacs'
    alias soffice="open -a 'LibreOffice.app'"
    export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig
    # PATH for Vagrant
    PATH=$PATH:/Applications/VirtualBox.app/Contents/MacOS/
    export PATH
    # pdftk
    export PATH=$PATH:/opt/pdflabs/pdftk/bin/
fi

# Linux only commands
if [[ $platform == 'linux' ]]; then
   alias open="xdg-open"
fi

# emacs
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"
alias ec="emacsclient -t"

# gnus mail emacs
export EMAIL="woquendo@gmail.com"
export NAME="William Oquendo"
export SMTPSERVER="smtp.gmail.com"

# locale fix
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#tmux
export TERM="xterm-256color"
alias tmux="tmux -2"  

# asymptote home
export ASYMPTOTE_HOME=/opt/asymptote/share/asymptote

# Aliases
alias pdflatex="pdflatex -file-line-error -shell-escape "
alias ls="ls -FG --color=auto  --group-directories-first"
alias l="ls"
alias rm="rm -i"
#alias xfig="xfig -startg 2 -startfo 21 -lat -spec -metric -startla SansSerif -startpo 0"
#alias xmgrace="xmgrace -geometry 1024x768 -fixed 640 480"
alias xmgrace="xmgrace -geometry 1013x760 -fixed 667 500"
alias xmgracel="xmgrace -legend load "
alias xmxydy="xmgrace -settype xydy "
alias xmxydxdy="xmgrace -settype xydxdy "
alias no="nohup wget -t inf -U 'Mozilla/5.0 (compatible; Konqueror/3.2; Linux)'"
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export MANPATH=$MANPATH:/usr/local/man
export MANPATH=$MANPATH:/usr/local/share/man
#export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig

# From arch bash wiki
## Modified commands ## {{{
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
# }}}
## ls ## {{{
#alias ls='ls -hF'# --color=auto' # is at the beginning of this file
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
# }}}
#alias tail='tail -f -n 50'
alias tmux='tmux -2'
alias remake='make clean; make'
alias extip='curl http://ipecho.net/plain; echo'
alias remote='vncserver -geometry 1680x1050 -dpi 120'


# Pygmentize less
function cless () {
    pygmentize -f terminal "$1" | less  -R
}

## Safety features ## {{{
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'                    # 'rm -i' prompts for every file
alias ln='ln -i'
#alias chown='chown --preserve-root'
#alias chmod='chmod --preserve-root'
#alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)
# }}}


# for gracegtk
#export GRACEGTK_HOME=/usr/local/gracegtk 
#export PATH=$PATH:/usr/local/gracegtk/bin

# PATH local commands 
export PATH=$PATH:$HOME/local/bin

# shell config
export HISTCONTROL=ignorespace
export HISTIGNORE="&:mutt:[bf]g:exit"
export HISTSIZE=10000
#export CDPATH=".:~"
export CDPATH="."
shopt -s cdspell
shopt -s cmdhist 
shopt -s dotglob
#export PS1="\[\033[1;37m\][\[\033[1;32m\]\u\[\033[1;37m\]@\[\033[1;37m\]\h\[\033[1;37m\]] \[\033[1;36m\]\w \[\033[1;33m\]\$\[\033[0m\] "
#export PS1='\[\e[1;32m\]\h:\[\e[m\]\[\e[1;30m\]\W\[\e[m\] \[\e[1;34m\]\u\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
#export PS1='\[\e[1;32m\]\u\[\e[m\]@\[\e[1;33m\]\h\[\e[m\] \[\e[1;34m\]\w/\[\e[m\]\[\e[1;32m\]\[\e[m\]\n\[\e[1;32m\]$ \[\e[m\]'
export PS1='\[\e[1;32m\]\u\[\e[m\]@\[\e[1;33m\]\h\[\e[m\] \[\e[1;34m\]\w/\[\e[m\]\[\e[1;32m\]\[\e[m\]\n\[\e[1;32m\]$(__git_ps1 "(%s)") $ \[\e[m\]'
#export PROMPT_COMMAND="echo; date; $PROMPT_COMMAND"
export PROMPT_COMMAND="echo; date;"

# Open man with skim
manp() 
{  
    man -t "${1}" | open -f -a Skim 
}


#MKL_NUM_THREADS=2
#export MKL_NUM_THREADS

# INTEL COMPILER
#source /opt/intel/composer_xe_2013.1.119/bin/compilervars_global.sh intel64

# tracker
export XUGGLE_HOME="/usr/local/xuggler"
#export DYLD_LIBRARY_PATH="${DYLD_LIBRARY_PATH}:/usr/local/xuggler/lib"
export TRACKER_HOME="/usr/local/tracker"

## LMGC90 2016
export PYTHONPATH=${PYTHONPATH}:$HOME/local/src/2016-LMGC90/lmgc90_user/build/
#export OMP_SCHEDULE=STATIC
#export OMP_NUM_THREADS=4

# mechsys
export MECHSYS_ROOT=$HOME/local/src/2016-MECHSYS/
# PATH="/Users/oquendo/perl5/bin${PATH+:}${PATH}"; export PATH;
# PERL5LIB="/Users/oquendo/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/Users/oquendo/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/Users/oquendo/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/Users/oquendo/perl5"; export PERL_MM_OPT;

# Android sdk
if [ -d "$HOME/Library/Android/sdk/platform-tools" ] ; then
    export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
fi

#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export MP_FULLNAME="William Fernando Oquendo Patino"

