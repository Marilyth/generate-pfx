# generate-pfx
Generate .pfx certificates for use in dotnet

To generate a certificate, download and install certbot
Then run `certbot certonly --standalone`

This file is then placed in `/c/Certbot/live` (Windows) or `/etc/letsencrypt/live` (Linux) after generating a certificate with it.
Add this to the Task Scheduler / Crontab to run roughly after certbot renew.
