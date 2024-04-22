#!/usr/bin/env bash

set -e

# https://gist.github.com/yoshinari-nomura/37366e913db502672f5de70553c5cc8e
# https://github.com/mivok/slack_status_updater/tree/master
# https://api.slack.com/methods/dnd.setSnooze
# https://api.slack.com/reference/manifests#creating_manifests

CREDENTIALS_FILE="$HOME/.slack/credentials"
TOKEN=""
SLACK_API_URL="https://slack.com/api"
SLACK_USER_PROFILE_ENDPOINT="/users.profile.set"
SLACK_DO_NOT_DISTURB_ENDPOINT="/dnd.setSnooze"
EMOJI_FOCUS=":focus:"
TEXT_FOCUS="Focus"
EMOJI_AVAILABLE=""
EMOJI_LUNCH=":taco:"
TEXT_AVAILABLE=""
TEXT_LUNCH="Lunch"

print_usage() {
  echo "Usage: $(basename $0) <option> [arg]"
  echo
  echo "Options:"
  echo "  focus <minutes>    Set focus mode for a specified duration in minutes."
  echo "  lunch <minutes>    Set lunch mode for a specified duration in minutes."
  echo "  available          Set available mode."
  echo
  echo "Examples:"
  echo "  $(basename $0) focus 60"
  echo "  $(basename $0) lunch 30"
  echo "  $(basename $0) available"
}

print_error() {
  printf "$(basename $0) - error: $@\n"
} >&2

fetch_token() {
  read -r TOKEN <$CREDENTIALS_FILE
}

call_slack_api() {
  response=$(
    curl -s -S -X POST \
      --data token="$TOKEN" \
      --data-urlencode "$2" \
      "$SLACK_API_URL$1" |
      sed -n 's/{"ok":false,"error":"\([^"]*\)".*/\1/p'
  )

  if [ -n "$response" ]; then
    print_error "$response"
    exit 1
  fi
}

get_unix_timestamp_duration() {
  if [[ -n "$1" ]] && [[ "$1" =~ ^[0-9]+$ ]] && [[ "$1" != "0" ]]; then
    current_timestamp=$(date +%s)
    duration_in_seconds=$(($1 * 60))
    expiration_timestamp=$((current_timestamp + duration_in_seconds))
    echo "${expiration_timestamp}"
  elif [[ "$1" == "0" ]]; then
    echo "0"
  else
    echo "Error: The expiration must be a number representing the duration in minutes."
    exit 1
  fi
}


update_status() {
  PROFILE="{\"status_emoji\":\"$1\",\"status_text\":\"$2\",\"status_expiration\":\"$3\"}"
  call_slack_api "$SLACK_USER_PROFILE_ENDPOINT" "profile=$PROFILE"
}

update_donotdisturb() {
  call_slack_api "$SLACK_DO_NOT_DISTURB_ENDPOINT" "num_minutes=$1"
}

set_mode() {
  fetch_token
  expiration_in_seconds=$(get_unix_timestamp_duration $3)
  update_status ${1:-""} ${2:-""} $expiration_in_seconds
  update_donotdisturb $3
}

# MAIN
if [ -z "$1" ]; then
  print_usage
  exit 0
fi

case "$1" in
focus)
  if [ -z "$2" ]; then
    print_error "focus duration (in minutes) required"
    print_usage
    exit 1
  fi
  set_mode $EMOJI_FOCUS $TEXT_FOCUS $2
  echo "Focus mode enabled"
  ;;
lunch)
  if [ -z "$2" ]; then
    print_error "lunch duration (in minutes) required"
    print_usage
    exit 1
  fi
  set_mode $EMOJI_LUNCH $TEXT_LUNCH $2
  echo "Lunch mode enabled"
  ;;
available)
  set_mode "$EMOJI_AVAILABLE" "$TEXT_AVAILABLE" "0"
  echo "Available mode enabled"
  ;;
*)
  print_error "invalid option $1"
  print_usage
  exit 1
  ;;
esac
