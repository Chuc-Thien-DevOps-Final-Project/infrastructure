#!/bin/bash
# This script initializes a Terraform repository structure with modules and environments.


# Name of the root directory
ROOT_DIR="terraform-infra"

# Check if the directory already exists
mkdir -p "$ROOT_DIR"/{modules/{vpc,ec2},envs/{dev,staging,prod}}

# Create the main Terraform configuration file
for ENV in dev staging prod; do
  cat > "$ROOT_DIR/envs/$ENV/main.tf" <<EOF
# main.tf for $ENV
module "vpc" {
  source = "../../modules/vpc"
  # example variables here
}

module "ec2" {
  source = "../../modules/ec2"
  # example variables here
}
EOF

  touch "$ROOT_DIR/envs/$ENV/variables.tf"
  touch "$ROOT_DIR/envs/$ENV/terraform.tfvars"
done

# Create the module files
for MODULE in vpc ec2; do
  cat > "$ROOT_DIR/modules/$MODULE/main.tf" <<EOF
# $MODULE module
EOF
done

echo "✅ Terraform repo structure created under '$ROOT_DIR'"
