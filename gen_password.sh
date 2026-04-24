#!/bin/bash

#-----------------------------------------
# Filename:   auto_add_user.sh
# Author:     RedDragon, Mallory Flesher
# Purpose:    Provides the password()
# function that generates a random
# password for each user
#
# Functionality:
#       1. Gen random passwords
#-----------------------------------------

source ./show_all_users.sh

password() {

     #making sure username.txt exists
     show_users > /dev/null 2>&1

     #my weakness, counters
     num=1

     #reading from file and inserting into array
     while IFS= read -r user; do
          #array of usernames
          userArr+=("$user")

          #making array of names
          name="${user//./ }"
          read -r -a parts <<< "$name"

          formatted=""
          for w in "${parts[@]}"; do
               formatted+="${w^} "
          done

          nameArr+=("${formatted% }")

     done < username.txt

     #removing first user from both array (should be person running application)
     userArr=("${userArr[@]:1}")
     nameArr=("${nameArr[@]:1}")

     #reading through array to  gen passwords for users
     for index in "${!userArr[@]}"
     do
          #assigning username to a variable
          account="${userArr[$index]}"

          #randomly generating 12 character password
          ranPass=$(tr -dc 'A-Za-z0-9!@#$%^&' </dev/urandom | head -c 12)

          #assigning password to user
          echo "$account:$ranPass" | sudo chpasswd

          #getting names to put into file for readability
          fullName="${nameArr[$index]}"

          #making and putting info in text file
          printf "%s. %s - Username: %s and Password: %s\n" "$num" "$fullName" "$account" "$ranPass" >> userpassList.txt

          #counter (because lovee)
          ((num++))
     done
}

