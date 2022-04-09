# Multiple-EC2-Instance
Terraform Module to launch Multiple AWS EC2 Instances


This project helps to met the requirement which is for the creation of Multiple EC2 Instances, VPC, and Subnets in a completely automated way. VPC creation includes 2 public subnets. Here it is configured in different AZ for each of the subnets, moreover, the Availability zones are automatically fetched via the data source. This also include the Resource Group for proper management of AWS resources. 


Terraform code to create resource group
Here, env=prod tag is used.

```
# code block
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
```
                   
modules folder contains two folder i.e compute and networking, it consist of resources to create EC2 instance and vpc respectively.
