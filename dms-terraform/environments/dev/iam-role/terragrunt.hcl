terraform {
  source                       = "../../../modules/iam-role"
}

include {
  path                         = "${get_terragrunt_dir()}/../root.hcl"
}

inputs = {
  region              = "us-east-1"
  role_name           = "dms-terraform-role"
  assume_role_policy  = jsonencode({
    Version           = "2012-10-17"
    Statement         = [
      {
        Action        = "sts:AssumeRole"
        Effect        = "Allow"
        Principal     = {
          Service     = "dms.amazonaws.com"
        }
      }
    ]
  })
}
