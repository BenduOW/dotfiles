# source external files
[[ -r ${ZDOTDIR:-$HOME}/.zaliases ]] && source ${ZDOTDIR:-$HOME}/.zaliases

# weird flex
if [ -f /usr/bin/fastfetch ]; then
  fastfetch
fi

# auto/tab complete
autoload -Uz compinit
setopt PROMPT_SUBST
compinit
_comp_options+=(globdots) # Include hidden files
zstyle ':completion:*' menu select

# ignore commands when beginning with a space
setopt HIST_IGNORE_SPACE

# plugin time
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.config/zsh/.zsh_history


# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bendu/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
