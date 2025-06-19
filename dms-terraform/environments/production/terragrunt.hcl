generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "production"
      Project     = "myapp"
      ManagedBy   = "Terraform"
      Owner       = "myapp"
    }
  }
}
EOF
}
