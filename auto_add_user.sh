#!/bin/bash

#-----------------------------------------
# Filename:   auto_add_user.sh
# Author:     RedDragon, Mallory Flesher
# Purpose:    Provides the add_user()
# 	      function that reads a
# text file that holds usernames and
# automatically generates passwords and
# user accounts for each username.
#
# Functionality:
#       1. Create accounts
#-----------------------------------------

source ./gen_password.sh
source ./show_all_users.sh

add_user() {
     show_users > /dev/null 2>&1

     #beginning messages
     echo "-------------------------------------------------"
     echo "                Adding Known Users               "
     echo "-------------------------------------------------"

     #reading from file
     IFS="#" read -r -a user_list < staff.txt

     #count
     n=0
     users=()

     #creating user
     for item in "${user_list[@]}"
     do
          echo "$((n+1))"

          #counter
          ((n++))

          #seperating first and last name
          read -r -a names <<< "$item"
          echo "Name: ${names[@]}"

          #setting name lowercase
          for i in "${!names[@]}"
          do
               names["$i"]=$(echo "${names[$i]}" | tr '[:upper:]' '[:lower:]')
          done

          #username
          username=$(IFS=.; echo "${names[*]}")

          #adding to array
          users+=("$username")

          #adding user
          output=$(sudo adduser --allow-bad-names --disabled-password --gecos "" "$username" 2>&1)

          while IFS= read -r line
          do
               echo -e "\t$line"
          done <<< "$output"

          echo "-------------------------------------------------"
     done

     #call password() to gen
     password "${users[@]}"
}
