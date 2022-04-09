aws_region = "us-east-1" 

vpc_cidr = "10.0.0.0/16"

subnets_cidr = [
    "10.0.1.0/24",
    "10.0.2.0/24"
]

key_name = "capstone"   # Change the name as per your key_name

instance_type = "t2.micro"  

instance_count = 2     # To launch multiple instance

name = "tf_prod"       # prefix name for all the resource

subnet_count = "2"     # Two public subnet 



