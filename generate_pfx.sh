#!/bin/bash

# To generate a certificate, download and install certbot
# Then run certbot certonly --standalone

# This file is then placed in /c/Certbot/live after generating a certificate with it, or the linux equivalent.
# Add this to the Task Scheduler to run roughly after certbot renew.

# Find all directories in the current location
for dir in */; do
    dir=${dir%/}  # Remove trailing slash

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
