#!/bin/bash

#-----------------------------------------
# Filename:   auto_add_user.sh
# Author:     RedDragon, Rachel Robertson
# Purpose:    Provides the MAdd()
#             function that takes a first
# and last name from input and allows
# an account to be created manually.
# A password is then generated for the
# account and then the account is created.
#
# Functionality:
#       1. Generate password
#       2. Create an account manually
#-----------------------------------------

MAdd(){
	echo "-------------------------------------------------"
	echo "                    Add User                     "
	echo "-------------------------------------------------"

	RED='\033[0;31m'
	GREEN='\033[0;32m'
	WHITE='\033[0m'

	# first name validation
	echo ""
	read -p "First name: " firstName

	while ! [[ "$firstName" =~ ^[a-zA-Z]+$ ]]; do
		echo -e "${RED}First name is invalid.${WHITE}"
		read -p "Please Enter the first name: " firstName
	done

	# ubuntu only accepts usernames with lowercase letters
	firstName=${firstName,,}

	# last name validation
	read -p "Last name: " lastName

	while ! [[ "$lastName" =~ ^[a-zA-Z]+$ ]]; do
        	echo -e "${RED}First name is invalid.${WHITE}"
        	read -p "Please Enter the last name: " lastName
	done

	# ubuntu only accepts usernames with lowercase letters
	lastName=${lastName,,}

	# puts username and password in the following format:
	# user-> first.last  pas-> firstlastDEELTECH
	userName="$firstName"".""$lastName"
	password="$firstName""$lastName""DEELTECH"

	# Adds the user without a password and then changes the password
	# immediately afterwards.
	sudo adduser $userName --allow-bad-names  --disabled-password --gecos ""
	echo "$userName:$password" | sudo chpasswd

	# Confirmation
	echo -e "${GREEN}${userName} added successfully.${WHITE}"
}
