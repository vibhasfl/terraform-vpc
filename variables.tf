# Values for certain varibles will be picked up from shell enviroment
# export TF_VAR_aws_profile="profilename"
# export TF_VAR_shared_credentials_path="~/.aws/credentials"
# Ref : https://registry.terraform.io/providers/hashicorp/aws/latest/docs#environment-variables
#     : https://stackoverflow.com/questions/53330060/can-terraform-use-bash-environment-variables

variable "shared_credentials_path" {
  description = "aws credentials to deploy your infra"
  type        = string
}

variable "aws_region" {
  description = "aws region where are infrastructure will be deployed"
  type        = string
  default     = "ap-south-1"
}

variable "aws_profile" {
  type = string
}

variable "projectname" {
  type    = string
  default = "apollo"
}

variable "aws_vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "aws_vpc_public_subnet_1a" {
  type    = string
  default = "10.0.0.0/24"
}

variable "aws_vpc_public_subnet_1b" {
  type    = string
  default = "10.0.1.0/24"
}

variable "aws_vpc_private_subnet_1a" {
  type    = string
  default = "10.0.2.0/24"
}

variable "aws_vpc_private_subnet_1b" {
  type    = string
  default = "10.0.3.0/24"
}

variable "aws_vpc_bastion_host_ami_id" {
  type    = string
  default = "ami-04b1ddd35fd71475a"
}

variable "aws_vpc_bastion_host_key_name" {
  type    = string
  default = "terraform"
}

variable "aws_vpc_bastion_host_allowed_ips" {
  type    = list
  default = ["116.73.130.190/32"]
}

