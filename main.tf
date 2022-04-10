#For VPC

module "networking" {
  source       = "./modules/networking"
  vpc_cidr     = var.vpc_cidr
  subnets_cidr = var.subnets_cidr
  subnet_count = var.subnet_count
  name         = var.name
}

#For EC2

module "compute" {
  source              = "./modules/compute"
  instance_count      = var.instance_count
  key_name            = var.key_name
  instance_type       = var.instance_type
  subnets             = module.networking.subnet
  security_group      = module.networking.sg
  name                = var.name
  resource_group_name = var.resource_group_name

  
}