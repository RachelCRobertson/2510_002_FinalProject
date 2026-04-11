#!/bin/bash

source ./auto_add_user.sh

delete_user()
{
     #counter
     num=0

     #fully deleting users
     for user in "${arr[@]}"
     do
          echo "$num"
          ((num++))

          #deleting user
          sudo deluser --remove-home "$user"

          #checking if delete worked
          id "$user"
          echo "-------------------------------------------------"
     done
}
