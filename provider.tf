provider "aws" {
  version = "~> 2.61"
  region  = var.region
}

terraform {
  backend "s3" {}
}
