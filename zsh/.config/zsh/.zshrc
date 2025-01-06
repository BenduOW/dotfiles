# source external files
[[ -r ${ZDOTDIR:-$HOME}/.zaliases ]] && source ${ZDOTDIR:-$HOME}/.zaliases

#if [ -f /usr/bin/fastfetch ]; then
 # fastfetch
#fi

autoload -Uz compinit
setopt PROMPT_SUBST
compinit
zstyle ':completion:*' menu select

source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh







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
