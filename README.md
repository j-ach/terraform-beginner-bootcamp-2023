# Terraform Beginner Bootcamp 2023

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

### Refactoring into bash scripts

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


### Working with env veriables


We can list out all enviorment vars (env vars) using the 'env' command
We can filter specific en vars using grep e.g. `env |grep AWS_`

#### Setting and unsetting env vars

In the terminal we can set using `export HELLO='world'`

In the terminal we can unset using `unset HELLO`

We can set env var temporarily when running a command
```
HELLO='world' ./bin/print_message

```
```
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing vars

We can print an env using echo e.g. `echo hello`

#### Scoping of env vars
When you open up new bash terminals in vs code it will not be aware of env vars in another window.
If you want to persist across all future bash terminals you need to set in your bash profile
