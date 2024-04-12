#  _________  _   _ ____   ____ 
# |__  / ___|| | | |  _ \ / ___|
#   / /\___ \| |_| | |_) | |    
#  / /_ ___) |  _  |  _ <| |___ 
# /____|____/|_| |_|_| \_\\____|
                              
# if not interactive -> do nothing
[[ $- != *i* ]] && return 

# ------- #
# General #
# ------- #
# {{{
setopt autocd		# Automatically cd into typed directory.
setopt share_history
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments # ignore comments
# Cache  
HISTFILE=~/.cache/zsh/history
HISTSIZE=50000
SAVEHIST=50000
# }}}

# -------------- #
# Complications  #
# -------------- #
#{{{
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)   # Include hidden files.

# Load nix completions
fpath=(~/.nix-profile/share/zsh/site-functions $fpath)

autoload -Uz compinit
compinit

# }}}

# -------------- #
# Vim            #
# -------------- #
#{{{

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
# }}}

# ------ #
# Looks  #
# ------ #
#{{{

#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
#

autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$fg[yellow]%}\$vcs_info_msg_0_%{$reset_color%}$%b "

function in_nix_shell() {
  if [ ! -z ${IN_NIX_SHELL+x} ];
    then echo " nix ";
  fi
}

RPS1="%F{yellow}%b$(in_nix_shell)%f$RPS1"

# git branch
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
zstyle ':vcs_info:*' formats ' (%b)' # git(main)

precmd () {
  vcs_info 
}

setopt prompt_subst


#neofetch
#}}}

# vim: foldmethod=marker
