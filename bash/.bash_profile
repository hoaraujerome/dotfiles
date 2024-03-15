# Only run on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    export BASH_SILENCE_DEPRECATION_WARNING=1
fi

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi
