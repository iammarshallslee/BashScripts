#!/bin/bash
function isPortInUse() {
	if lsof -Pi :$1 -sTCP:LISTEN -t >/dev/null ; then
		return 0 # 0 is true in the shell.
	else
		return 1
	fi
}

isPortInUse $1
