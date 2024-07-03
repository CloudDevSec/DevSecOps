provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = "my-unique-bucket-devsecops"
}
