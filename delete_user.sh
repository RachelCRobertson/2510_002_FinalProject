#!/bin/bash

delete_user()
{
     source auto_add_user.sh

     num=0

     #fully deleting users
     for user in "${arr[@]}"
     do
          echo "$num"
          ((num++))
          sudo deluser --remove-home "$user"
          id "$user"
          echo "-------------------------------------------------"
     done
}
delete_user
