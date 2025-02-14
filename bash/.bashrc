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
alias suspend='systemctl suspend'


alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias cat='bat'
alias ocat='/bin/cat'

alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Log out and log back in for change to take effect.'"


export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man! -c "set number"'
alias vim='nvim'

alias oneofetch='/usr/bin/neofetch'
alias neofetch='fastfetch'

alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'

PS1='[\u@\h \W]\$ '

export LD_PRELOAD=/usr/lib64/libstdc++.so.6

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

eval "$(starship init bash)"
eval "$(zoxide init bash)"
