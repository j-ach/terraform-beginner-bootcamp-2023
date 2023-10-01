

terraform {
#     cloud {
#     organization = "terraformpracticej_a"
#     workspaces {
#       name = "terra-house-new-rug"
#     }
#   }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
}
provider "random" {
  # Configuration options
}