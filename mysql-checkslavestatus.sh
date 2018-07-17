#!/bin/bash
HOSTNAME=$(hostname)
function checkSlaveStatus() {
	SLAVE_IO_RUNNING=`mysql --login-path=check_slave_status -e 'show slave status\G' | grep Slave_IO_Running`
	SLAVE_SQL_RUNNING=`mysql --login-path=check_slave_status -e 'show slave status\G' | grep Slave_SQL_Running`

	if [[ $SLAVE_IO_RUNNING = *"Yes"* ]] && [[ $SLAVE_SQL_RUNNING = *"Yes"* ]]; then
		echo "Both Slave IO and Slave SQL are running"
	else
		echo "There is a problem with the MySQL Slave."
	fi
}

checkSlaveStatus
