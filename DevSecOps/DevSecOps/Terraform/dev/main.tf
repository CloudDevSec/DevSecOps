provider "aws" {
  region = "eu-central-1a"
}

module "s3_bucket" {
  source      = "../../modules/s3_bucket"
  bucket_name = "dev-my-unique-bucket-name"
}
