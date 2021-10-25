# cf-terraforming

Original idea from repo: https://github.com/cloudflare/cf-terraforming

## Important
You must init and install locally the CloudFlare terraform provider in order for this to work.\
CloudFlare provider: https://registry.terraform.io/providers/cloudflare/cloudflare/latest \

## Update
The image has been modified to automatically download and install terraform v1.0.9 and perform init with a simple `provider.tf` file that uses CloudFlare provider.
## Build locally
Run inside your cloned repository:
```bash
~$ docker build -t cf-terraforming:master .
```

## Run
Run anywhere:
```bash
~$ docker run -it --rm cf-terraforming:master
cf-terraforming is an application that allows Cloudflare users
to be able to adopt Terraform by giving them a feasible way to get
all of their existing Cloudflare configuration into Terraform.
```

## Example usages
```bash
~$ docker run -it --rm cf-terraforming:master generate -t "YOUR_TOKEN" --resource-type "RESOURCE_NAME" -z "YOUR_ZONE_ID"
~$ docker run -it --rm cf-terraforming:master generate -e "YOUR_EMAIL" -a "YOUR_ACCOUNT_ID" --resource-type "RESOURCE_NAME" -z "YOUR_ZONE_ID"
```

## Resources
You can find these here: https://github.com/cloudflare/cf-terraforming#supported-resources

## CloudFlare Terraforming arguments
```
Usage:
  cf-terraforming [command]

Available Commands:
  completion  generate the autocompletion script for the specified shell
  generate    Fetch resources from the Cloudflare API and generate the respective Terraform stanzas
  help        Help about any command
  import      Output `terraform import` compatible commands in order to import resources into state
  version     Print the version number of cf-terraforming

Flags:
  -a, --account string                  Use specific account ID for commands
  -c, --config string                   Path to config file (default "/root/.cf-terraforming.yaml")
  -e, --email string                    API Email address associated with your account
  -h, --help                            help for cf-terraforming
  -k, --key string                      API Key generated on the 'My Profile' page. See: https://dash.cloudflare.com/profile
      --resource-type string            Which resource you wish to generate
      --terraform-install-path string   Path to the Terraform installation (default ".")
  -t, --token string                    API Token
  -v, --verbose                         Specify verbose output (same as setting log level to debug)
  -z, --zone string                     Limit the export to a single zone ID

Use "cf-terraforming [command] --help" for more information about a command.

```
