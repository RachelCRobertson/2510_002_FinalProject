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

m_del(){

     	show_users
     	echo "============================================================="
     	echo "                        Delete User                          "
     	echo "============================================================="
     	echo ""

     	num=1;
     	while [[ "$num" -ne 0 ]]; do
     		counter=0;

     		#reading from file and inserting into array
     		while IFS= read -r user; do
         		userArr+=("$user")
	  		counter=$((counter + 1))
     		done < username.txt

		# if there are not at least 2 users the function returns
		if [[ $counter -le 1 ]]; then
			echo ""
			echo "WARNING: There are not enough users on the device to delete users. "
			echo "         There must be at least 2 users on the device to delete users."
			echo "	 Exiting delete user..."
			echo ""
			return
		fi

     		# getting user input
     		echo "0. Exit Delete User"
     		echo "1-$counter. Delete User"
     		echo ""
     		read -p "Please enter the number that corrisponds to the user you want to delete: " num


     		# Checks that the value input is only numbers and is whithin the correct range
     		# If the user inputs 0 the function ends
     		while ! [[ "$num" =~ ^[0-9]+$ && "$num" -le $counter && "$num" -ge 0 ]]; do

			if [[ $counter -le 1 ]]; then
                		echo ""
                		echo "WARNING: There are not enough users on the device to delete additional users. "
                		echo "         Exiting delete user..."
                		echo ""
                		return
        		fi

			if [[ "$num" = 0 ]]; then
				echo ""
				echo "Exiting delete user..."
				echo ""
				return
			fi

			echo ""
			echo "0. Exit Delete User"
			echo "1-$counter. Delete User"
                	echo ""
			read -p "Invalid choice, Please enter a number from 1 to $counter: " num

     		done
		echo ""
	#--------------------Prevents users who are logged in from being deleted-----------------------

		#Get array of users that are currentlly logged on
		loggedOnArr=( $( who | awk '{print $1}' ) )

		# iterates through the logged on users
		for user in "${loggedOnArr[@]}"; do

			# Checks the chosen user against logged on users
			if [[ "${userArr[$((num-1))]}" = $user ]]; then
				echo ""
				echo "WARNING: The user you attempted to delete is logged on."
				echo "	     You cannot delete users that are logged on."
				echo "	     Exiting delete user..."
				echo ""
				return
			fi
		done

		# Locates the user based on their index and deletes it
		for (( i=0; i<counter; i++ )); do
			if [[ $i = $((num-1)) ]]; then
				echo "Deleting ${userArr[$i]}..."

				sudo deluser --remove-home "${userArr[$i]}"

          			#checking if delete worked
          			id "$user"

				# remove from text file?
			fi
		done

		if [[ $num -ne 0  ]]; then

			# Calls show users after a sucessful deletion
                        show_users

			# clears array
			unset userArr

			counter=0;
        		#reading from file and inserting into array
        		while IFS= read -r user; do
                		userArr+=("$user")
                		counter=$((counter + 1))
        		done < username.txt

		fi
	done
}
