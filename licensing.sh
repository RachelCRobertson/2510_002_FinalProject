#!/bin/bash

# Licesing script
# Made using Brave AI

#!/bin/bash

# Licensing library - source this in your scripts
# Usage: source license.sh && validate_license

LICENSE_FILE="license.dat"
VALID_KEY_OBFUSCATED="MTYzNDU2Nzg5MDEyMzQ1Ng=="

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

    # License validated - run main program
    if [[ -f "./main.sh" ]]; then
        bash ./main.sh
    else
        echo "Error: main.sh not found"
        exit 1
    fi
}

prompt_for_license() {
    while true; do
        echo "Please enter your 16-digit license key:"
        read -s user_key
        echo

        # Validate 16-digit format
        if [[ "$user_key" =~ ^[0-9]{16}$ ]]; then
            # Encode and store
            echo "$VALID_KEY_OBFUSCATED" > "$LICENSE_FILE"
            echo "License activated successfully!"
            break
        else
            echo "Invalid format. Please enter exactly 16 digits."
        fi
    done
}

validate_license
