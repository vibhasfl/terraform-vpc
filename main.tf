provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = var.shared_credentials_path
  profile                 = var.aws_profile
}

resource "aws_vpc" "apollo_vpc" {
  cidr_block       = var.aws_vpc_cidr
  instance_tenancy = "default"
  tags = {
    "Name" = var.aws_vpc_name
  }
}
