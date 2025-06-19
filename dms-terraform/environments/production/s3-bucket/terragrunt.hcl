terraform {
  source = "../../../modules/s3-bucket"
}

include {
  path = find_in_parent_folders()
}

dependency "iam_role" {
  config_path = "../iam-role"
}

inputs = {
  bucket_name         = "sample-bucket-prod"
  versioning_enabled  = true
  aws_role_arn        = "arn:aws:iam::xxxx:role/sample-role"
}
