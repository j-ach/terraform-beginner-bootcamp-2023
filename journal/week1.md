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
