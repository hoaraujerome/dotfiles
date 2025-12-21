# Only run on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  export BASH_SILENCE_DEPRECATION_WARNING=1
fi

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

# Load bash-completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] &&
  source "/opt/homebrew/etc/profile.d/bash_completion.sh"

eval "$(/opt/homebrew/bin/brew shellenv)"

## PROMPT
eval "$(starship init bash)"

## bash completion
source /opt/homebrew/etc/bash_completion.d/kubectx
source /opt/homebrew/etc/bash_completion.d/kubectl
