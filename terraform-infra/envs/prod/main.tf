# main.tf for prod
module "vpc" {
  source = "../../modules/vpc"
  # example variables here
}

module "ec2" {
  source = "../../modules/ec2"
  # example variables here
}
