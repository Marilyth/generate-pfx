# generate-pfx
Generate .pfx certificates for use in dotnet

To generate a certificate, download and install certbot
Then run certbot certonly --standalone

This file is then placed in /c/Certbot/live after generating a certificate with it, or the linux equivalent.
Add this to the Task Scheduler / Crontab to run roughly after certbot renew.
