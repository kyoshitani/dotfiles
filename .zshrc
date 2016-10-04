## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

## Default shell configuration
#
# set prompt
#
case ${UID} in
0)
    PROMPT=$'%{\e[32m%}%U%m{%n}%%%{\e[m%}%u '
    PROMPT2=$'%B%{\e[31m%}%_#%{\e[m%}%b '
    SPROMPT=$'%B%{\e[31m%}%r is correct? [n,y,a,e]:%{\e[m%}%b '
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT=$'%{\e[37m%}${HOST%%.*} ${PROMPT}'
    ;;
*)
    PROMPT=$'%{\e[32m%}%U%m{%n}%%%{\e[m%}%u '
    RPROMPT=$'%{\e[32m%}%/%%%{\e[m%} '
    RPROMPT2=$'%{\e[32m%}%_%%%{\e[m%} '
    SPROMPT=$'%{\e[32m%}%r is correct? [n,y,a,e]:%{\e[m%} '
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT=$'%{\e[37m%}${HOST%%.*} ${PROMPT}'
    ;;
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
#   to end of it)
#
bindkey -v

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# predict search
#
autoload predict-on
predict-on

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

## Completion configuration
#
autoload -U compinit
compinit

## set collor and alias
#
alias ls="ls -G"
alias gls="gls --color"

case "${TERM}" in
kterm*|xterm*)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

## zsh editor
##
autoload zed

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac