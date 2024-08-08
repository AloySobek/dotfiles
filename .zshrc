autoload -Uz compinit
autoload -Uz vcs_info

precmd() { compinit }
precmd() { vcs_info }

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt PROMPT_SUBST

zstyle ':vcs_info:git:*' formats '%b '

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

HISTFILE=$HOME/.zsh_history
SAVEHIST=65536
HISTSIZE=65536

PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

source /Users/aloysobek/.docker/init-zsh.sh || true # Added by Docker Desktop

export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

# opam configuration
[[ ! -r /Users/aloysobek/.opam/opam-init/init.zsh ]] || source /Users/aloysobek/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export PATH=/Users/aloysobek/go/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
