#!/bin/bash

# Licensing script
# Made using Brave AI

# Licensing library - source this in your scripts
# Usage: source license.sh && validate_license

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
    local stored_key=$(cat "$LICENSE_FILE" 2>/dev/null)
    if [[ -z "$stored_key" ]] || [[ "$stored_key" != "$VALID_KEY_OBFUSCATED" ]]; then
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
    while [[ "$encoded_user_key" != "$VALID_KEY_OBFUSCATED" ]]; do
        echo "Please enter your 16-digit license key:"
        read -s user_key
        echo

        # Validate 16-digit format
        if [[ "$user_key" =~ ^[0-9]{16}$ ]]; then
            # Encode user input and compare
            local encoded_user_key=$(echo -n "$user_key" | base64)

            if [[ "$encoded_user_key" == "$VALID_KEY_OBFUSCATED" ]]; then
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
