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
alias tf='terraform'

# ls
alias ls='ls --color=auto'
alias ll='ls -la'

# second brain
alias sb='cd "$SECOND_BRAIN"'
alias sbc='$SCRIPTS/createnote.sh coding'
alias sbo='$SCRIPTS/createnote.sh other'
alias sbd='cd "$SECOND_BRAIN/coding"'

# pomodoro
alias pomo='~/.local/bin/pomo'

# kubectl
alias k='kubectl'

## Functions
# pomodoro
pos() {
	pomo start "$1m"
}

# slack status updater
lu() {
	bash $SCRIPTS/slack_status_updater.sh lunch "$1"
}

fo() {
	pomo start "$1m"
	bash $SCRIPTS/slack_status_updater.sh focus "$1"
}

av() {
	pomo stop
	bash $SCRIPTS/slack_status_updater.sh available
}
