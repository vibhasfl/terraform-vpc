# terraform-vpc


## Setting up enviroment variables
```
> export TF_VAR_shared_credentials_path="~/.aws/credentials"
> export TF_VAR_aws_profile="profilename"
```

## Using Terraform 

1. Pull and initialize project with AWS plugin
```
> terraform init
```
2. View changes to infra
```
> terraform plan
```
3. Apply changes
```
> terraform apply
```
4. Destroy infra
```
> terraform destroy
```


Diagram :
![VPC](https://github.com/vibhasfl/terraform-vpc/blob/main/VPC.jpg)


