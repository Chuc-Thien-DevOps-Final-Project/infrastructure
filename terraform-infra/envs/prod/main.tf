provider "aws" {
  region = "us-east-2"

}

terraform {

  backend "s3" {
    bucket       = "tct-backend"
    key          = "module/terraform.tfstate"
    region       = "us-east-2"
    use_lockfile = true
    encrypt      = true
  }
}

module "vpc" {
  source = "../../modules/vpc"
  name   = "${var.project_name}-prod-vpc-test"

}


module "eks" {
  source = "../../modules/eks"
  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
  node_groups = var.node_groups
  cluster_role_arn = var.cluster_role_arn
  node_role_arn = var.node_role_arn

  
}

# resource "aws_eks_cluster" "main" {
#   name    = var.cluster_name
#   version = var.cluster_version
#   #   role_arn = aws_iam_role.cluster.arn
#   role_arn = var.cluster_role_arn

#   vpc_config {
#     subnet_ids = module.vpc.public_subnet_ids
#   }


# }



# resource "aws_eks_node_group" "main" {
#   for_each = var.node_groups

#   cluster_name    = aws_eks_cluster.main.name
#   node_group_name = each.key
#   #   node_role_arn   = aws_iam_role.node.arn
#   node_role_arn = var.node_role_arn
#   subnet_ids    = module.vpc.private_subnet_ids

#   instance_types = each.value.instance_types
#   capacity_type  = each.value.capacity_type

#   scaling_config {
#     desired_size = each.value.scaling_config.desired_size
#     max_size     = each.value.scaling_config.max_size
#     min_size     = each.value.scaling_config.min_size
#   }

# }