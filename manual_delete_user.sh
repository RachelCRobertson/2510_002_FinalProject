#!/bin/bash

#-----------------------------------------
# Filename:   manual_delete_user.sh
# Author:     RedDragon, Mallory Flesher
# Purpose:    Provides the m_del()
# 	      function takes a username from
# input and searches through a text file of all
# usernames and deletes the given username.
#
# Functionality:
#       1. Deletes user
#-----------------------------------------

m_del()
{
     echo "-------------------------------------------------"
     echo "                  Delete User                    "
     echo "-------------------------------------------------"
     echo ""

     #getting user input
     read -p "Username: " user


     while true; do
          #getting user input
#          read -p "Username: " user

          if grep -Fxq "$user" username.txt; then
               sudo deluser --remove-home "$user" 2>&1 | sed 's/^/\t/'
               echo "-------------------------------------------------"
               grep -Fxv "$user" username.txt > temp.txt && mv temp.txt username.txt
               break
          else
               echo -e "Username not found."
               read -p "Please enter the username: " user
          fi
     done
}
