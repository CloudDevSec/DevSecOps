provider "aws" {
  region = "eu-central-1a"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-unique-bucket-devsecops"
  acl    = "private"
}