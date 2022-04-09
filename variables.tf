variable "aws_region" {}

variable "vpc_cidr" {}

variable "subnets_cidr" {
  type = list
}

variable "key_name" {}

variable "instance_type" {}

variable "instance_count" {
  default = 1
  
}

variable "name" {}

variable "subnet_count" {}