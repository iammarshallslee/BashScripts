#!/bin/bash

# NOTE: THIS SCRIPT WORKS ONLY WHEN RUN UNDER ROOT.
function isPortInUse() {
	if lsof -Pi :$1 -sTCP:LISTEN -t >/dev/null ; then
		return 0 # return 0 when true
	else
		return 1
	fi
}

isPortInUse $1
