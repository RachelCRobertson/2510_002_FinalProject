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

     #getting the first user from array
     first="${userArr[0]}"

     #checking with user that it is them
     echo "To avoid further incidents make sure this is your username before contuning"
     printf "Is this you?: %s " "$first"
     read -p "[y/n]: " choice
     choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

     #yes
     if [[ "$choice" == "y" ]]; then
          userArr=("${userArr[@]:1}")
     #no
     else
          #printing users list
          show_users
          echo ""
          #getting user input on which account they want to keep
          read -p "Pick yourself: " input
          #getting it from the array
          first="${userArr[$((input - 1))]}"
          index=$((input - 1))
          #removing it from the array and rebuilding it to avoid empty index
          userArr=("${userArr[@]:0:$index}" "${userArr[@]:$((index + 1))}")
     fi

      #reading through array to delete users
      for user in "${userArr[@]}"; do
          #counter
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
