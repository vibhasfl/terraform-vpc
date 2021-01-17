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

variable "aws_vpc_name" {
  type = string
}

variable "aws_vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
