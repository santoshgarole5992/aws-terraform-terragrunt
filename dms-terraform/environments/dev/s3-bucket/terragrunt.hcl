terraform {
  source                      = "../../../modules/s3-bucket"
}

include {
  path                        = "${get_terragrunt_dir()}/../root.hcl"
}

dependency "iam_role" {
  config_path                 = "../iam-role"
  
  mock_outputs = {
    role_arn                  = "arn:aws:iam::123456789012:role/mock-role"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

inputs = {
  bucket_name         = "dms-terraform-bucket"
  versioning_enabled  = true
  aws_role_arn        = dependency.iam_role.outputs.role_arn
}
