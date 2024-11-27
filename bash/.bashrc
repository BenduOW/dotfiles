#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /usr/bin/fastfetch ]; then
	fastfetch
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'

alias grep='grep --color=auto'

alias shut='shutdown'

alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias cat='bat'

export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man! -c "set number"'
alias vim='nvim'

alias oneofetch='/usr/bin/neofetch'
alias neofetch='fastfetch'

alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'

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

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

eval "$(starship init bash)"
eval "$(zoxide init bash)"
