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

## PROMPT
get_kube_context() {
	kubectl config current-context 2>/dev/null
}

# Function to get the current Kubernetes namespace
get_kube_namespace() {
	kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null
}

PS1="\[\033[01;34m\]\w\[\033[00m\] \[\033[01;32m\]\$(get_kube_context) \$(get_kube_namespace)\[\033[00m\] \[\033[01;31m\]>\[\033[00m\] "
