#!/bin/bash

# Find all directories in the current location
script_dir="$(cd "$(dirname "$0")" && pwd)"
cd $script_dir

for dir in */; do
    # Check if the directory contains the required files
    if [ -f "$dir/privkey.pem" ] && [ -f "$dir/fullchain.pem" ]; then
        # Navigate into the directory
        cd "$dir" || exit

        # Convert the certbot certificates to a PFX file
        openssl pkcs12 -export -out certificate.pfx -inkey privkey.pem -in fullchain.pem -passin pass: -passout pass:""

        # Check if the certificate is created successfully
        if [ -f "certificate.pfx" ]; then
            echo "Certificate created successfully in $dir"
        else
            echo "Failed to create certificate in $dir"
        fi

        # Return to the original directory
        cd - || exit
    fi
done
