terraform {
  source = "../../../modules/endpoints"
}

include {
  path = find_in_parent_folders()
}

dependency "s3_bucket" {
  config_path = "../s3-bucket"
}

dependency "iam_role" {
  config_path = "../iam-role"
}

inputs = {
  endpoint_name   = "sample-endpoint"
  username        = "sample-user"
  password        = "sample-password"
  server_name     = "sample-server"
  database_name   = "sample-db"
  port            = 5432
  bucket_name     = dependency.s3_bucket.outputs.bucket_name
  aws_role_arn    = dependency.iam_role.outputs.role_arn
  # Add other required variables as needed
}
