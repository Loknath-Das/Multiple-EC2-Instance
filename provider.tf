provider "aws" {
  region   = var.aws_region["virginia"] # region names can be found in variables.tf file
  profile  = "terraform"           # changeable as per user configuration
}
