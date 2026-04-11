#!/bin/bash

echo "-------------------------------------------------"
echo "                    Add User                     "
echo "-------------------------------------------------"

RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[0m'

#Adds a user manually
echo ""
read -p "First name: " firstName

while ! [[ "$firstName" =~ ^[a-zA-Z]+$ ]]; do
	echo -e "${RED}First name is invalid.${WHITE}"
	read -p "Please Enter the first name: " firstName
done

# ubuntu only accepts usernames with lowercase letters
firstName=${firstName,,}

read -p "Last name: " lastName

while ! [[ "$lastName" =~ ^[a-zA-Z]+$ ]]; do
        echo -e "${RED}First name is invalid.${WHITE}"
        read -p "Please Enter the last name: " lastName
done

# ubuntu only accepts usernames with lowercase letters
lastName=${lastName,,}


userName="$firstName"".""$lastName"
password="$firstName""$lastName""DEELTECH"

sudo adduser $userName --allow-bad-names  --disabled-password --gecos ""
echo "$userName:$password" | sudo chpasswd

echo -e "${GREEN}${userName} added successfully.${WHITE}"
