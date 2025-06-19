terraform {
  source = "../../../modules/iam-role"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  region              = "us-east-1"
  role_name           = "sample-role"
  assume_role_policy  = "{}"
}
