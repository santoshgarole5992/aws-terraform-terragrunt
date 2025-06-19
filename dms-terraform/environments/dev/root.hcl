locals {
  # Common variables
  account_code    = "123456789012"
  env_code        = "dev"
  application_name = "dms"
  env             = "development"
  
  # AWS Region
  aws_region = "us-east-1"
  
  # Common tags
  common_tags = {
    Environment = local.env
    Application = local.application_name
    ManagedBy   = "terragrunt"
  }
}

# Configure provider
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"
  
  default_tags {
    tags = ${jsonencode(local.common_tags)}
  }
}
EOF
}

# Configure backend
generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "s3" {
    bucket         = "convera-terragrunt-sf-nonprod"
    key            = "dms/${path_relative_to_include()}/terraform.tfstate"
    region         = "${local.aws_region}"
    encrypt        = true
    dynamodb_table = "convera-data-test-locking-table"
  }
}
EOF
} 