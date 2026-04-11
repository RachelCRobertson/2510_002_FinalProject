#!/bin/bash

echo "-------------------------------------------------"
echo "                    Add User                     "
echo "-------------------------------------------------"

RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[0m'

#Adds a user manually
echo ""
echo "Minimum length (3)."
echo "Maximum length(32)."
echo "No uppercase letters."
echo "No special characters."
echo "Must begin with a lowercase letter."
read -p "Please Enter your username: " name

while ! [[ "$name" =~ ^[a-z][0-9a-z]{3,32}$ ]]; do
	echo -e "${RED}Username is invalid.${WHITE}"
	read -p "Please Enter your username: " name
done

 sudo adduser $name
 sudo userdel $name
echo -e "${GREEN}${name} added successfully.${WHITE}"
