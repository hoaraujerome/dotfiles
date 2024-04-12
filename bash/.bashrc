## ENVVARS
export VISUAL=nvim
export EDITOR=nvim
export SECOND_BRAIN="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/secondbrain"
export SCRIPTS="$HOME/dotfiles/scripts"
export HOMEBREW_NO_AUTO_UPDATE=1

## ALIASES
# Misc.
alias t='tmux'
alias v='nvim'

# ls
alias ls='ls --color=auto'
alias ll='ls -la'

# second brain
alias sb='cd "$SECOND_BRAIN"'
alias sbc='$SCRIPTS/createnote.sh coding'
alias sbo='$SCRIPTS/createnote.sh other'

# pomodoro
alias pomo='~/.local/bin/pomo'

# kubectl
alias k='kubectl'

## PROMPT
eval "$(starship init bash)"
