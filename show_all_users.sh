#!/bin/bash

#shows all users currentlly on the system

show_users(){
	echo "-------------------------------------------------------------"
	echo "                          All Users                          "
	echo "-------------------------------------------------------------"
	awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd
	echo "-------------------------------------------------------------"
}

#show_users
