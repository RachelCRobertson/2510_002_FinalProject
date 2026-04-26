#!/bin/bash

#-----------------------------------------
# Filename:   restart.sh
# Author:     RedDragon, Rachel Robertson
# Purpose:    Restarts main.sh
#             Restarts main.sh after adding
# new users so that manual_delete_user.sh
# can function properly
#
# Functionality:
#       1. Kills and restarts main
#-----------------------------------------

kill main.sh
 ./main.sh
