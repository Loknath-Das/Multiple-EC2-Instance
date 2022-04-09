resource "aws_resourcegroups_group" "rgrp" {
  name = "env-prod"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::EC2::Instance"
  ],
  "TagFilters": [
    {
      "Key": "env",
      "Values": ["prod"]
    }
  ]
}
JSON
  }
}

#network 

module "networking" {
  source       = "./modules/networking"
  vpc_cidr     = var.vpc_cidr
  subnets_cidr = var.subnets_cidr
  subnet_count = var.subnet_count
  name         = var.name
}

#Ec2

module "compute" {
  source           = "./modules/compute"
  instance_count   = var.instance_count
  key_name         = var.key_name
  instance_type    = var.instance_type
  subnets          = module.networking.subnet
  security_group   = module.networking.sg
  name             = var.name

  
}