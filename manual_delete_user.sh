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
source ./show_all_users.sh

m_del()
{
     show_users
     echo "-------------------------------------------------"
     echo "                  Delete User                    "
     echo "-------------------------------------------------"
     echo ""

     user=1;
     while [[ "$user" -ne 0 ]]; do
     	counter=0;

     	#reading from file and inserting into array
     	while IFS= read -r user; do
         	userArr+=("$user")
	  	counter=$((counter + 1))
     	done < username.txt

     	#getting user input
     	echo "0. Exit Delete User"
     	echo "1-$counter. Delete User"
     	echo ""
     	read -p "Please enter the number that corrisponds to the user you want to delete: " user


     	# Checks that the value input is only numbers and is whithin the correct range
     	# If the user inputs 0 the function ends
     	while ! [[ "$user" =~ ^[0-9]+$ && "$user" -le $counter && "$user" -ge 0 ]]; do
		if [[ "$user" = 0 ]]; then
			return
		fi
		echo ""
		echo "0. Exit Delete User"
		echo "1-$counter. Delete User"
                echo ""
		read -p "Invalid choice, Please enter a number from 1 to $counter: " user

     	done
	echo ""
done

     # while loop to check for the desired user
#     while true; do
          #getting user input

#          if grep -Fxq "$user" username.txt; then
#               sudo deluser --remove-home "$user" 2>&1 | sed 's/^/\t/'
#               echo "-------------------------------------------------"
#               grep -Fxv "$user" username.txt > temp.txt && mv temp.txt username.txt
#               break
#          else
#               echo -e "Username not found."
#               read -p "Please enter the username: " user
#          fi
#     done
}
m_del
