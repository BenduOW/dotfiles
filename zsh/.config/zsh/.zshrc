# source external files
[[ -r ${ZDOTDIR:-$HOME}/.zaliases ]] && source ${ZDOTDIR:-$HOME}/.zaliases
#[[ -r $HOME/.zprofile ]] && source $HOME/.zprofile
[[ -r ${ZDOTDIR:-$HOME}/.zprofile ]] && source ${ZDOTDIR:-$HOME}/.zprofile

export HISTORY_IGNORE="(ls|ll|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

# weird flex
#if [ -f /usr/bin/fastfetch ]; then
#  fastfetch
#fi

if [ "$TERM_PROGRAM" != "vscode" ]; then
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

function ex {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "ex: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}



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
