#!/bin/bash

REGEX='^[0-9]+$'
function isPortInUse() {
	if [[ -z "$1" ]]; then
		echo "Please specify a port, e.g. ./isPortInUse 80"
		exit 1
    elif ! [[ $1 =~ $REGEX ]]; then
        echo "error: Not a number" >&2;
        exit 1
	else
		if lsof -Pi :$1 -sTCP:LISTEN -t >/dev/null ; then
			echo "Port $1 is in use."
		else
			echo "Port $1 is not in use."
		fi
	fi
}

isPortInUse $1
