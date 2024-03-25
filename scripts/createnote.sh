#!/usr/bin/env bash

set -e

print_usage() {
	echo "Usage: $(basename $0) <coding|other>"
	exit 1
}

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
		echo "# $2"
		echo "Source: "
		echo -en "\n"
		echo "Original title: "
		echo -en "\n"
		echo "Publisher: "
		echo -en "\n"
		echo "Headings: "
		echo -en "\n"
		echo -en "\n"
		echo -en "\n"
		echo -en "\n"
		echo "$timestamp"
	} >>"$2.md"

	popd
}

create_note() {
	title=$(get_title)
	create_file $1 "$title"
}

# MAIN
if [ -z "$1" ]; then
	print_usage
fi

case "$1" in
coding | other)
	create_note $1
	;;
*)
	echo "$(basename $0) - invalid option: $1" >&2
	print_usage
	;;
esac
