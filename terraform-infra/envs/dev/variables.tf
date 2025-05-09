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
