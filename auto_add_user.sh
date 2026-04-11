#!/bin/bash

#beginning messages
echo "-------------------------------------------------"
echo "                Adding Known Users               "
echo "-------------------------------------------------"

#reading from file
IFS="#" read -r -a user_list < staff.txt

#array for deleting accounts
arr=()

n=0
#creating user
for item in "${user_list[@]}"
do
     echo "$n"
     ((n++))
     #seperating first and last name
     read -r -a names <<< " $item"
     echo "Name: ${names[@]}"
     
     #setting name lowercase
     for i in "${!names[@]}"
     do
          names["$i"]=$(echo "${names[$i]}" | tr '[:upper:]' '[:lower:]')
     done

     #username
     username=$(IFS=-; echo "${names[*]}")
     echo "Username: $username"
     
     arr+=("$username")
     
     #password
     phrase="DEELTECH"
     password=$(IFS=; echo "${names[*]}$phrase")
     echo "Password: $password"

     #adding user
     output=$(sudo adduser --disabled-password --gecos "" "$username" 2>&1)

     while IFS= read -r line
     do
          echo -e "\t$line"
     done <<< "$output"

     echo "$username:$password" | sudo chpasswd
     
     echo "-------------------------------------------------"
done
