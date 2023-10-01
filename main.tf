


resource "random_string" "bucket_name" {
  upper = false
  length           = 30
  special          = false

}

resource "aws_s3_bucket" "example1"{
  bucket = random_string.bucket_name.result

  tags = {
    UserUuid = var.user_uuid
  }
}

