variable "aws_region" {
    type = map
    default = {
        ohio        = "us-east-2",
        virginia    = "us-east-1",
        california  = "us-west-1",
        oregon      = "us-west-2",
        capetown    = "af-south-1",
        hongkong    = "ap-east-1",
        mumbai      = "ap-south-1",
        osaka       = "ap-northeast-3",
        seoul       = "ap-northeast-2",
        singapore   = "ap-southeast-1",
        sydney      = "ap-southeast-2",
        tokyo       = "ap-northeast-1",
        canada      = "ca-central-1",
        frankfurt   = "eu-central-1",
        ireland     = "eu-west-1",
        london      = "eu-west-2",
        milan       = "eu-south-1",
        paris       = "eu-west-3",
        stockholm   = "eu-north-1",
        bahrain     = "me-south-1"
 }
  
}  # Can be used in provider.tf file for specifying region

variable "vpc_cidr" {}

variable "subnets_cidr" {
  type = list
}

variable "key_name" {}

variable "instance_type" {}

variable "instance_count" {
  default = 1
  
}

variable "resource_group_name" {}

variable "name" {}

variable "subnet_count" {}