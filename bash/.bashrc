#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'

alias grep='grep --color=auto'

alias oneofetch='/usr/bin/neofetch'
alias neofetch='fastfetch'

PS1='[\u@\h \W]\$ '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bendu/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bendu/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bendu/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bendu/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export LD_PRELOAD=/usr/lib64/libstdc++.so.6

eval "$(starship init bash)"
