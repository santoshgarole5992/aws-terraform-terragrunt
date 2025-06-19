terraform {
  source = "../../../modules/secrets-manager"
}

include {
  path = "${get_terragrunt_dir()}/../root.hcl"
}

dependency "s3_bucket" {
  config_path = "../s3-bucket"
  
  mock_outputs = {
    bucket_name = "mock-bucket-name"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

dependency "iam_role" {
  config_path = "../iam-role"
  
  mock_outputs = {
    role_arn = "arn:aws:iam::123456789012:role/mock-role"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

inputs = {
  secret_name = "dms-terraform-source-db-credentials"
  username    = "admin"
  password    = "your-secure-password"  # Replace with your actual password
}
