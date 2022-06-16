# aws_ami filter to pick up the ami available in our region

data "aws_ami" "amazon-linux-2" {
	 most_recent = true
	 owners      = ["amazon"] 

	filter { 
	  name   = "name" 
	  values = ["amzn2-ami-hvm*"] 
  } 
}

# Resource Group 
# resource "aws_resourcegroups_group" "rgrp" {
#   name = var.resource_group_name

#   resource_query {
#     query = <<JSON
# {
#   "ResourceTypeFilters": [
#     "AWS::EC2::Instance"
#   ],
#   "TagFilters": [
#     {
#       "Key": "env",
#       "Values": ["prod"]
#     }
#   ]
# }
# JSON
#   }
# }



# EC2 Instance

resource "aws_instance" "ec2" {
    count                           = var.instance_count
    ami                             = data.aws_ami.amazon-linux-2.id
    instance_type                   = var.instance_type
    associate_public_ip_address     = true
    key_name                        = var.key_name
    vpc_security_group_ids          = ["${var.security_group}"]
    subnet_id                       = "${element(var.subnets, count.index)}"

   tags = {
    env  = "prod"
    Name = "${var.name}-instance- ${count.index + 1}"
  }
}