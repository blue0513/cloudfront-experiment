variable "bucket_name" {}

terraform {
  required_version = ">= 1.7.0"
}

provider "aws" {
  region = "ap-northeast-1"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  cloudfront_origin_access_identity = module.cloudfront.origin_access_identity
}


module "cloudfront" {
  source = "./modules/cloudfront"

  origin_id = module.s3.bucket_id
  domain_name = module.s3.bucket_regional_domain_name
}
