# generate-pfx
Generate .pfx certificates for all domains for use in dotnet

To generate a certificate, download and install certbot
Then run `certbot certonly --standalone`

This file is then placed in `/c/Certbot/live` (Windows) or `/etc/letsencrypt/live` (Linux) after generating a certificate with it.
Add this to the Task Scheduler / Crontab to run roughly after certbot renew.

E.g. `sudo crontab -e`

Then add `0 0 * * * /etc/letsencrypt/live/generate_pfx.sh`

The .pfx file will be called `certificate.pfx`, and be located in the domain name folder.
