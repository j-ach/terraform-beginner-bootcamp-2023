# Terraform Beginner Bootcamp 2023 - week 0

- [Install the terraform CLI](#install-the-terraform-cli)
  * [Considerations wtih the Terraform CLI changes](#considerations-wtih-the-terraform-cli-changes)
  * [Considerations for linux distribution](#considerations-for-linux-distribution)
- [Refactoring into bash scripts](#refactoring-into-bash-scripts)
  * [Shebang considerations](#shebang-considerations)
- [Execution Considerations](#execution-considerations)
    + [linux permissions considerations](#linux-permissions-considerations)
  * [Github lifecycle (Before, init, Command)](#github-lifecycle--before--init--command-)
  * [AWS cli installation](#aws-cli-installation)
- [Terraform basics](#terraform-basics)
  * [Terraform registry](#terraform-registry)
  * [Terrafform Console](#terrafform-console)
    + [Terrform init](#terrform-init)
    + [Terraform plan](#terraform-plan)
    + [Terraform apply](#terraform-apply)
  * [Terraform Lock Files](#terraform-lock-files)
  * [Terraform state file](#terraform-state-file)
  * [Terraform Directory](#terraform-directory)

- [Installing terraform cli](#install-the-terraform-cli)
    - [Considerations for linux distribution](#considerations-for-linux-distribution)
- [Refactoring into bash scripts](#refactoring-into-bash-scripts)


## Install the terraform CLI

### Considerations wtih the Terraform CLI changes
The terraform CLI installation intructions have changed due to gpg keyring changes. So we needed to refer to the latest instal CLI. instruction via terrafirm documentation and change the srcipting for install

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for linux distribution

This project is built against unbuntu.
Please consider checking your linux distrubution and change accordingly to distrubtion needs.
[How to check OS version in linux](https://cloudzy.com/blog/find-os-version-with-command-line/)

Example of checking OS version
```sh
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

## Refactoring into bash scripts

While fixing the Terraform CLI gpg depreciation issues we notice that the bash script steps were considerable amount more code. so we decided to create a bash scrip to install the terraform CLI

This bash script is located here : [./bin/install_terraform_cli.sh](./bin/install_terraform_cli.sh)

- This will keep the gitpod task file ([.gitpod.yml](.gitpod.yml)]tidy.
- This allows us an easier way to debug and excute manually
- This will allow better portability for the other projects that need to install the terraform cli

### Shebang considerations

A Shebang (sha-bang) Tells the bash script what program that will interpet the script. `#!/bin/bash`


ChatGPT recommended we use this format for bash: `#!/usr/bin/env bash`
- For portability
- Will search for different OS distrubtions

https://en.wikipedia.org/wiki/Shebang_(Unix)

## Execution Considerations

When executing the bash script we can use the `./` shorthand notation to excute the bash script.

e.g `.bin/install_terraform_cli`

If we are using a script in gitpod.yml we need to point the script to a program to interpet it

#### linux permissions considerations 

In order to make our bach script excutable we need to change it's permissions

```sh
chmod u+x ./bin/install_terraform_cli.sh
```

alternatively 
```sh
chmod 744 ./bin/install_terraform_cli.sh
```
### Github lifecycle (Before, init, Command)

We need to be careful when using the init

### AWS cli installation 

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Getting started install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS CLI Env vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)
We can check if our AWS cred are configured correctly
```sh
aws sts get-caller-identity
```

If it is successful you should see a json payload return that looks like this 
```json

{
    "UserId": "SFDFSSFILNB1245",
    "Account": "5567876566776",
    "Arn": "arn:aws:iam::1234556789876:user/training"
}
```

Will need to generate  CLI credits from IAM in order to use aws CLI

## Terraform basics

### Terraform registry

Terraform sources their providers and modules from the terraform registory which is located  at [registry.terraform.io](https://registry.terraform.io/)   

- **Providers** is a interfacer to APIS tthat will allow you to create resources in terraform.
- **Modules** are a way to create templates of terraform code which can be reusabled and allows for portablity 
[Random terraform provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs)

### Terrafform Console

We can see a list of all the terraform commands by typing terraform in the terminal `terraform`

#### Terrform init

At the start of a project you run a `terraform init` to initialise the project and download all the dependencies
For e.g when adding a new provider to your project you will need to perform a `terraform init` so that all the files needed will be downloaded.

#### Terraform plan
`terraform plan`
Checks the terraform state(actual state) against the terraform config(desired state) then it can figure out what api call are needed to provision the difference

#### Terraform apply
`terraform apply`
This will run a plan and then provision the resources to matched the the plan. Running an apply will prompt the user with a yes or no.

If we want to automatically approve an apply we can use the auto approve flag `terraform apply --auto-approve`
### Terraform Lock Files
`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project
The terraform lock file **should be commited** to your version control system, (VSC) e.g. Github, gitlab

### Terraform state file
`.terraform.tfstate` Contains all the information about your current state of your infrastructure 

This file **should not be commited** to your VCS.
This file can contain sensitive data
If you lose this file you lose knowing your state

`.terraform.tfstate.backup` is tyhe previous state file state.

### Terraform Directory

`terraform` directory contains binaries of terraform providers.

#### Terraform Destroy
`terraform destroy`
This will destroy resources.



