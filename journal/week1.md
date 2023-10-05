# Terraform Beginner Bootcamp 2023 - week 1
## Root Module structure 

Our root module structure is as follows
```
PROJECT_ROOT/
├── main.tf - # everything else
├── variables.tf - # Stores the structure of input variables
├── providers.tf - # defines required providers and their configuration
├── outputs.tf - # stores our outputs
├── terraform.tfvars - # the data of variables we want to load into our terraform projects
└── README.md - # required for root modules
```

[Standard modules structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## AWS credentials issue 
When ever I was running a terraform plan after migrating to terraform cloud I would get an error even after I have exported the credentials, etc

```json
Error: No valid credential sources found
│ 
│   with provider["registry.terraform.io/hashicorp/aws"],
│   on <empty> line 0:
│   (source code not available)
│ 
│ Please see https://registry.terraform.io/providers/hashicorp/aws
│ for more information about providing credentials.
│ 
│ Error: failed to refresh cached credentials, no EC2 IMDS role found,
│ operation error ec2imds: GetMetadata, request canceled, context deadline
│ exceeded
```

### AWS credentials workaround
I had to set the variables on terraform cloud for 
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- Added the region into the provider.tf file


## Terraform input variables
## Terraform Cloud Variables
Im terraform we can set two kind of variables:
- Enviroment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - Those that you would normallly set in you tfvars file

We can set terraform cloud variable to sensitive so it is not shown in the UI.

### Loading terraform input variables

[terraform inpit variables](https://developer.hashicorp.com/terraform/language/values/variables)

We can use the `-var` flag to override a variable in the tfvars file eg. ` terraform -var user_uuid="fgsergsf"`

### var-file flag
- todo: researh the flag

### terraform .tfvars

This is the default file to load in terraform variables in

### auto.tfvars

- todo: document this functionality for terraform cloud

### order of terraform variables

- TODO: document which terraform variables take predesence 


## Dealing with configuration drift

## What happens if you lose your state file

If you lose your statefile, you most likeley have to tear down all the resources manually.

You can use terraform import but it wont work for all resources 
### Fix manual configuration
If someone go and delete or modifies cloud resource manually through clickops.

If we run terraform plan is with attempt tro put our infrastructure back into the expected state fixing Configuration drift 

### Fix missing resources with Terraform import 

[terraform import](https://developer.hashicorp.com/terraform/tutorials/state/state-import?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)

## Terraform Modules

### Terraform modules Structure
It is reccommended to place modules in a `module` directory when locally developing modules but you can name it whatever you like.
### Passing Input Variables 

We can pass input variables to our module.
The module has to delare the terraform variables in its own variable.tf

## Modules Sources
Using the source we can import the source from multiple places eg:
- locally
- github
- Terraform Registry

```terrform
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```