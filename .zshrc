# Pretty prompt (refer to http://www.pixelbeat.org/docs/terminal_colours/)
ORANGE=$'\e[38;5;166m'
BLUE=$'\e[38;5;33m'
RESET=$'\e[0m'
export PROMPT="%{$ORANGE%}%n@%m %{$BLUE%}%~ %{$ORANGE%}%#%{$RESET%} "

# Shell behaviour
export EDITOR='vi'
bindkey -v               # Use vi keybindings
setopt AUTO_CD           # Interpret plain directory name as a CD command
setopt PUSHD_IGNORE_DUPS # Don't push a directory using pushd that's already on the stack
setopt RMSTARSILENT      # Don't prompt on every invocation of 'rm *'
unsetopt LIST_BEEP       # Don't beep when tab completion yields an ambiguous result

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt SHAREHISTORY      # Share history between sessions
setopt HISTIGNOREALLDUPS # Don't keep duplicate commands in the history
setopt HIST_IGNORE_SPACE # Don't add commands that begin with a space to the history

# Auto-completion
autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b ~/.dir_colors)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
lr() { ls -lt $@ | head }
lmf() { ls -t1 $@ | head -1 }
up() { targetPath=""; for i in {1..$1}; do targetPath="../$targetPath"; done; cd $targetPath }
alias tmux='tmux -2'

# Initialize system-dependent environment variables and aliases
if [ -e ~/.envfile ]; then . ~/.envfile; fi
