#!/usr/bin/env bash

set -e

CREDENTIALS_FILE="$HOME/.slack/credentials"
TOKEN=""

print_usage() {
	echo "Usage: $(basename $0) <focus>"
	exit 1
}

print_error() {
	printf "$(basename $0) - error: $@\n"
} >&2

get_title() {
	read -p "Enter the title: " title
	echo "$title"
}

create_file() {
	INBOX_PATH="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/secondbrain/$1/0-inbox"

	pushd "$INBOX_PATH"

	touch "$2.md"

	timestamp="$(date +"%Y%m%d%H%M")"
	{
		echo "# "
		echo -en "\n"
		echo -en "\n"
		echo -en "\n"
		echo "***"
		echo "* Source: "
		echo "* Original title: "
		echo "* Publisher: "
		echo "* Headings: "
		echo "***"
		echo -en "\n"
		echo "$timestamp"
	} >>"$2.md"

	popd
}

create_note() {
	title=$(get_title)
	create_file $1 "$title"
}

fetch_token() {
	read -r TOKEN <$CREDENTIALS_FILE
	# print $token
	# TOKEN=$token
}

update_status() {
	EMOJI=":focus:"
	TEXT="Focus"
	PROFILE="{\"status_emoji\":\"$EMOJI\",\"status_text\":\"$TEXT\"}"
	response=$(
		curl -s -S -X POST \
			--data token="$TOKEN" \
			--data-urlencode profile="$PROFILE" \
			https://slack.com/api/users.profile.set |
			sed -n 's/{"ok":false,"error":"\([^"]*\)".*/\1/p'
	)

	if [ -n "$response" ]; then
		print_error "$response"
		exit 1
	fi
}

set_focus_mode() {
	fetch_token
	update_status
	echo "Focus mode enabled"
}

# MAIN
if [ -z "$1" ]; then
	print_usage
fi

case "$1" in
focus)
	set_focus_mode
	;;
*)
	echo "$(basename $0) - invalid option: $1" >&2
	print_usage
	;;
esac
