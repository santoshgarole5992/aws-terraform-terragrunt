terraform {
  source = "../../../modules/secrets-manager"
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
  secret_name = "sample-secret"
  username    = "sample-user"
  password    = "sample-password"
}
