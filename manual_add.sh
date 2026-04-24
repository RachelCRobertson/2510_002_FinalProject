#!/bin/bash

#-----------------------------------------
# Filename:   manual_add.sh
# Author:     RedDragon, Rachel Robertson
# Purpose:    Provides the m_add()
#             function that takes a first
# and last name from input and allows
# an account to be created manually.
#
# Functionality:
#       1. Create an account manually
#-----------------------------------------

m_add()
{
	echo "-------------------------------------------------"
	echo "                    Add User                     "
	echo "-------------------------------------------------"

	# first name validation
	echo ""
	read -p "First name: " firstName

	while ! [[ "$firstName" =~ ^[a-zA-Z]+$ ]]; do
		echo -e "First name is invalid."
		read -p "Please Enter the first name: " firstName
	done

	# ubuntu only accepts usernames with lowercase letters
	firstName=${firstName,,}

	# last name validation
	read -p "Last name: " lastName

	while ! [[ "$lastName" =~ ^[a-zA-Z]+$ ]]; do
        	echo -e "Last name is invalid."
        	read -p "Please Enter the last name: " lastName
	done

	# ubuntu only accepts usernames with lowercase letters
	lastName=${lastName,,}

	# puts username and password in the following format:
	# user-> first.last
	userName="$firstName"".""$lastName"

	echo ""

	echo "Adding $firstName.$lastName..."

	# Adds the user without a password and then changes the password
	# immediately afterwards.
	sudo adduser --allow-bad-names  --disabled-password --gecos "" "$userName" 2>&1 | sed 's/^/\t/'
	#calling password() to gen
        password

	echo ""
}
