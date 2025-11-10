ssh-add  ~/.ssh/id_ed25519
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

export CLICOLOR=1
alias ls="ls -G"
alias ll="ls -lG"
export PATH="/usr/local/opt/php@8.2/bin:$PATH"
export PATH="/usr/local/opt/php@8.2/bin:$PATH"

# ~/.zshrc

eval "$(starship init zsh)"

#          ╭──────────────────────────────────────────────────────────╮
#          │                          Prompt                          │
#          ╰──────────────────────────────────────────────────────────╯
eval "$(starship init zsh)"
# colorscript exec crunchbang-mini
# pokeget random

#          ╭──────────────────────────────────────────────────────────╮
#          │                         Plugins                          │
#          ╰──────────────────────────────────────────────────────────╯

# ── Initialise plugin manager ─────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# ── Syntax highlighting ───────────────────────────────────────────────
zinit light zsh-users/zsh-syntax-highlighting

# ── Completions ───────────────────────────────────────────────────────
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
# Load completions 
autoload -U compinit && compinit
# Completion styling (case sensitivity)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# ── Suggestions ───────────────────────────────────────────────────────
zinit light zsh-users/zsh-autosuggestions

#          ╭──────────────────────────────────────────────────────────╮
#          │                         History                          │
#          ╰──────────────────────────────────────────────────────────╯
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

bindkey '^[[A' history-search-backward # up arrow
bindkey '^[[B' history-search-forward # down arrow



#          ╭──────────────────────────────────────────────────────────╮
#          │                         Aliases                          │
#          ╰──────────────────────────────────────────────────────────╯
alias ls='ls --color'
# alias vim='nvim'
alias neofetch='hyfetch'

#          ╭──────────────────────────────────────────────────────────╮
#          │                    Shell integrations                    │
#          ╰──────────────────────────────────────────────────────────╯
eval "$(fzf --zsh)"
