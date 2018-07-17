#!/bin/bash
HOSTNAME=$(hostname)

function checkSlaveStatus() {
	SLAVE_IO_RUNNING=`mysql -u$1 -p$2 -e 'show slave status\G' | grep Slave_IO_Running`
	SLAVE_SQL_RUNNING=`mysql -u$1 -p$2 -e 'show slave status\G' | grep Slave_SQL_Running`

	if [[ $SLAVE_IO_RUNNING = *"Yes"* ]] && [[ $SLAVE_SQL_RUNNING = *"Yes"* ]]; then
		return 1
	else
		return 0
	fi
}

checkSlaveStatus $1 $2

#STATUS=$?
#if [[ "$STATUS" -eq "1" ]]; then
#	echo "Yes"
#else
#	echo "No"
#fi
