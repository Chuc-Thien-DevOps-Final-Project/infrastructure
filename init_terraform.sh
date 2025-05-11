#!/bin/bash

# Tên repo gốc
ROOT_DIR="terraform-infra"

# Tạo cấu trúc thư mục
mkdir -p "$ROOT_DIR"/{modules/{vpc,ec2},envs/{dev,staging,prod}}

# Tạo file mẫu cho mỗi môi trường
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

# Tạo module cơ bản
for MODULE in vpc ec2; do
  cat > "$ROOT_DIR/modules/$MODULE/main.tf" <<EOF
# $MODULE module
EOF
done

echo "✅ Terraform repo structure created under '$ROOT_DIR'"
