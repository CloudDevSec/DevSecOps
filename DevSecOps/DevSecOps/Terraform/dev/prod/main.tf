provider "aws" {
  region = "eu-central-1a"
}

module "s3_bucket" {
  source      = "../../modules/s3_bucket"
  bucket_name = "prod-my-unique-bucket-name"
}
