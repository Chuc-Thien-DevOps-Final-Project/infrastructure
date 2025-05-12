variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "tct-final-project"
  
}

variable "bucket_name" {
  description = "S3 bucket name for Terraform state"
  type        = string
  default     = "tct-final-project-terraform-state"
  
}

variable "key" {
  description = "S3 key for Terraform state"
  type        = string
  default     = "terraform.tfstate"
  
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
  
}

variable "ssh_key_name" {
  description = "Name of the SSH key pair for EC2 instance"
  type        = string
  default     = "tct-ssh-key" # Example key pair name, can be overridden
  
}

variable "ssh_key_path" {
  description = "Path to the SSH key pair for EC2 instance"
  type        = string
  default     = "./tct-ssh-key.pem" # Example path, can be overridden
  
}

variable "provisioner_commands" {
  description = "Provisioner commands for EC2 instance"
  type        = list(string)

  default = [
    "sudo yum update -y",
    "sudo amazon-linux-extras enable docker",
    "sudo yum install -y docker",
    "sudo systemctl start docker",
    "sudo systemctl enable docker",
    "sudo usermod -aG docker $USER",
    "newgrp docker",
    # "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
    # "sudo chmod +x /usr/local/bin/docker-compose",
    # "docker-compose version",

  ]
  
}