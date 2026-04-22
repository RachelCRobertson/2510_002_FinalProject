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

     num=1;
     while [[ "$num" -ne 0 ]]; do
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
     	read -p "Please enter the number that corrisponds to the user you want to delete: " num


     	# Checks that the value input is only numbers and is whithin the correct range
     	# If the user inputs 0 the function ends
     	while ! [[ "$num" =~ ^[0-9]+$ && "$num" -le $counter && "$num" -ge 0 ]]; do
		if [[ "$num" = 0 ]]; then
			return
		fi
		echo ""
		echo "0. Exit Delete User"
		echo "1-$counter. Delete User"
                echo ""
		read -p "Invalid choice, Please enter a number from 1 to $counter: " num

     	done
	echo ""
	counter=0;
	for user in "{userArr[@]}"; do
		if [[ $counter = $num-1 ]]; then
			echo "$num. $user deleted."
			# remove from text file?
		fi
			counter=$((counter +1))
			echo "counter = $counter, num = $num"
			echo "userArr[0] = ${userArr[0]}"
	done
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
