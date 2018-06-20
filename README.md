# terraform-xybersolve.io

> Terraform scripted simple static website using S3 & Route53 for DNS

## Note
This service is pulled out of a larger project and was not developed as a
reusable module. It is nonetheless somewhat stand alone.

### Assumptions
The Route53 assumes that a primary domain with NS record already exists,
designated in `dns_host_name`. This service basically adds a subdomain
to that domain host.

###### Update terraform variables
* `vars.tf`: local project variables
* `env.tf`: this ties into larger project

###### Update bash config file
* `web.conf.sh`: Supply directories and files pertinent to your site.

## `web` support script
Provision the website content. Change the variables assignments in `web.conf.sh`.
After site deployment, this script will enable you to manage your website.

###### web: script for S3 content management

```sh

$ ./web --help

    Script: web
    Purpose:
    Usage: web [options]

    Options:
      --help:  help and usage
      --version: show version info

      --upload: upload all pertinent files and directories
      --upload-dir=<directory>: upload a given directory
      --delete=<directory>: Delete a directory
      --delete-all: Delete all content
      --delete-logs: Delete all logs
      --remove-log: Remove the log bucket
      --list: List all the content
      --size: show sizes

```

## [License](LICENSE.md)
