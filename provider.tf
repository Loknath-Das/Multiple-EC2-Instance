provider "aws" {
  region   = var.aws_region["virginia"] # region names can be found in variables.tf file
  profile  = "default"           # changeable as per user configuration
}
