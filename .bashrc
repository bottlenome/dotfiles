if [ -f "/usr/local/etc/bash_completion.d/git-prompt.sh" ]; then
    source /usr/local/etc/bash_completion.d/git-prompt.sh
    source /usr/local/etc/bash_completion.d/git-completion.bash
    GIT_PS1_SHOWDIRTYSTATE=true
    export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
fi
export HISTSIZE=10000

if type -P dircolors > /dev/null ; then
    eval `dircolors $HOME/.dir_colors`
fi
