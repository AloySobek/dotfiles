autoload -Uz compinit; compinit
autoload -Uz history-search-end
autoload -Uz vcs_info;

zstyle ':vcs_info:*' enable git 
zstyle ':vcs_info:*' formats "%F{%m}%b%f "
zstyle ':vcs_info:*' actionformats "%F{%m}%b|%a%f "
zstyle ':vcs_info:git*+set-message:*' hooks git-uncommited

+vi-git-uncommited() {
    git diff --quiet HEAD

    if [ $? -ne 0 ]; then
        hook_com[misc]='red'
    else
        hook_com[misc]='green'
    fi
}

precmd() { vcs_info }

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt PROMPT_SUBST

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

HISTFILE=$HOME/.zsh_history
SAVEHIST=65536
HISTSIZE=65536

PROMPT='%F{yellow}%~%f ${vcs_info_msg_0_}$ '

alias ls='ls --color=auto'
alias ll='ls -al'

source /Users/aloysobek/.docker/init-zsh.sh || true # Added by Docker Desktop

# opam configuration
[[ ! -r /Users/aloysobek/.opam/opam-init/init.zsh ]] || source /Users/aloysobek/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export PATH=/Users/aloysobek/go/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

