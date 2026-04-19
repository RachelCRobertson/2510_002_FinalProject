#!/bin/bash

#-----------------------------------------
# Filename:   delete_user.sh
# Author:     RedDragon, Mallory Flesher
# Purpose:    Provides the delete_user()
#             function. Designed for
# Testing and demo purposes ONLY. It
# references the auto_add_user.sh file
# and deletes every user added by
# the add_user() function.
#
# Functionality:
#       1. Delete auto added users
#-----------------------------------------

source ./auto_add_user.sh

GREEN="\033[0;32m"
WHITE="\033[0m"

delete_user()
{
     #counter
     num=0

     #fully deleting users
     while IFS= read -r user
     do
          echo "$num"
          ((num++))

          #deleting user
          sudo deluser --remove-home "$user"

          #checking if delete worked
          id "$user"
	  echo -e "${GREEN}$user removed successfully.${WHITE}"
          echo "-------------------------------------------------"
     done < username.txt

     #deleting txt file
     if [ -f "username.txt" ]; then
          rm "username.txt"
     fi
}
delete_user
