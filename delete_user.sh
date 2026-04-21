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

source ./show_all_users.sh

GREEN="\033[0;32m"
WHITE="\033[0m"

delete_user()
{
     #calling show_all_user funciton for username.txt file
     show_users > /dev/null 2>&1

     #counter
     num=1

     #reading from file and inserting into array
     while IFS= read -r user; do
          userArr+=("$user")
     done < username.txt

     #getting the first user
     first="${userArr[0]}"

     #checking with user that it is them
     echo "To avoid further incidents make sure this is your username before contuning"
     printf "Is this you?: %s " "$first"
     read -p "[y/n]: " choice
     choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

     #yes
     if [[ "$choice" == "y" ]]; then
          userArr=("${userArr[@]:1}")
     else
          show_users
          echo ""
          read -p "Pick yourself: " input
          first="${userArr[$((input - 1))]}"
          index=$((input - 1))
          userArr=("${userArr[@]:0:$index}" "${userArr[@]:$((index + 1))}")
     fi

     printf "%s\n" "${userArr[@]}"

      for user in "${userArr[@]}"; do
          echo "$num"
          ((num++))

          #deleting user
          sudo deluser --remove-home "$user"

          #checking if delete worked
          id "$user"
          echo "-------------------------------------------------"
      done
}
delete_user
