#!/bin/bash

#------------------------------------------------------
# Filename:   licensing.sh
# Author:     RedDragon, Rachel Robertson, Brave AI Leo
# Purpose:    Provides the validate_license()
#             function that requires the end user
# to input a 16-digit key in order to generate a .dat
# file that is checked for whenever the main script is
# run.
#
# Functionality:
#       1. Checks for license
#       2. Gens license if user inputs key
#------------------------------------------------------

# Made using Brave AI


GREEN="\033[0;32m"
WHITE="\033[0m"

LICENSE_FILE="license.dat"
VALID_KEY_OBFUSCATED="NzM4MjkxMDQ1NjcyMzg0OQ=="

validate_license() {
    # Check if license file exists
    if [[ ! -f "$LICENSE_FILE" ]]; then
        prompt_for_license
    fi

    # Read and validate license
    local storedKey=$(cat "$LICENSE_FILE" 2>/dev/null)
    if [[ -z "$storedKey" ]] || [[ "$storedKey" != "$VALID_KEY_OBFUSCATED" ]]; then
        echo "Invalid license. Please re-enter."
        prompt_for_license
    fi

    # License validated - returns to main
    if [[ -f "./main.sh" ]]; then
       # bash ./main.sh
	echo "------------------------------------------------"
	echo -e "              ${GREEN}Valid License found!"
	echo -e "                 Access granted${WHITE}"
	echo "------------------------------------------------"
	return 0
    else
        echo "Error: main.sh not found"
        exit 1
    fi
}

prompt_for_license() {
    while [[ "$encodedUserKey" != "$VALID_KEY_OBFUSCATED" ]]; do
        echo "Please enter your 16-digit license key:"
        read -s userKey
        echo

        # Validate 16-digit format
        if [[ "$userKey" =~ ^[0-9]{16}$ ]]; then
            # Encode user input and compare
            local encodedUserKey=$(echo -n "$userKey" | base64)

            if [[ "$encodedUserKey" == "$VALID_KEY_OBFUSCATED" ]]; then
                # Store the obfuscated key
                echo "$VALID_KEY_OBFUSCATED" > "$LICENSE_FILE"
                echo "License activated successfully!"
            else
                echo "Invalid license key. Please try again."
            fi
        else
            echo "Invalid format. Please enter exactly 16 digits."
        fi
    done
}

validate_license
