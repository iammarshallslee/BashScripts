#!/bin/bash
REGEX='^[0-9]+$'
function findPIDByPort() {
	if [[ -z "$1" ]]; then
		echo "Please specify a port, e.g. ./findPIDByPort.sh 80"
		exit 1
	elif ! [[ $1 =~ $REGEX ]]; then
		echo "$1 is not a number" >&2;
		exit 1
	else
		if ./isPortInUse.sh $1; then 
			echo `lsof -i:$1 -t`
		else
			echo "There is no PID listening on $1."
		fi
	fi
}

findPIDByPort $1
