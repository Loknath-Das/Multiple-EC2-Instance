# All the changes to be made in this file
vpc_cidr = "10.0.0.0/16"

subnets_cidr = [
    "10.0.1.0/24",
    "10.0.2.0/24"
]

key_name = "capstone"   # Change the name as per your key_name

instance_type = "t2.small"  

instance_count = 1     # To launch multiple instance

name = "tf_prod"       # prefix name for all the resource

subnet_count = "1"     # Two public subnet 

#resource_group_name = "production"  # Resource Group Name



