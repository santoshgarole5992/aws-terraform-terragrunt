terraform {
  source = "../../../modules/replication-instance"
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
  account_code                    = "sample-account"
  env_code                        = "production"
  application_name                = "sample-app"
  env                             = "production"
  replication_instance_class      = "dms.t3.medium"
  replication_allocated_storage   = 20
  repl_auto_minor_version_upgrade = false
  availability_zone               = "us-east-1a"
  repl_engine_version             = "3.4.6"
  kms_key_arn                     = "arn:aws:kms:us-east-1:xxxx:key/xxxxx"
  multi_az                        = false
  preferred_maintenance_window    = "wed:12:28-wed:12:58"
  publicly_accessible             = false
  network_type                    = "IPV4"
  vpc_security_group_ids          = ["sg-xxxx"]
  subnet_ids                      = ["subnet-xxxx"]
}
