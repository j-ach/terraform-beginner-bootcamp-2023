#     cloud {
#     organization = "terraformpracticej_a"
#     workspaces {
#       name = "terra-house-new-rug"
#     }
#   }



terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

resource "aws_s3_bucket" "website_bucket" {

  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }
}