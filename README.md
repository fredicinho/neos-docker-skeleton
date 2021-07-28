# neos-docker-skeleton

This is a docker-compose-skeleton for a Neos Site.
I use Hetzner Cloud to provision an Ubuntu server.

## Requirements
* You need to install Terraform locally.
* You need a Domain working over Cloudflare

## How-To
* Set all required Variables in the following Files:
    * .env
    * variables.tf (Check that the SSH-Key-Variable points to the right file)
    * startscript.sh
    
* Execute following commands:
````shell
terraform init
terraform plan
terraform apply
````

The startscript.sh will be executed when the server is ready. You have to wait some minutes until the containers are available.

Credits go to:
* https://github.com/psmb/docker-neos-alpine
* https://github.com/andrewmackrodt/nginx-letsencrypt-cloudflare
