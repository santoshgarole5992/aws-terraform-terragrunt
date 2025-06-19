locals {
  # Get common variables from parent
  common_vars = read_terragrunt_config("../root.hcl")
  account_code = local.common_vars.locals.account_code
  env_code = local.common_vars.locals.env_code
  application_name = local.common_vars.locals.application_name
  env = local.common_vars.locals.env
}

# Include parent configuration
include "root" {
  path = "../root.hcl"
}

# Module configuration
terraform {
  source = "../../../modules/replication-instance"
}

# Module inputs
inputs = {
  account_code = local.account_code
  env_code = local.env_code
  application_name = local.application_name
  env = local.env
  
  # Replication instance specific variables
  replication_allocated_storage = 20
  repl_auto_minor_version_upgrade = true
  repl_engine_version = "3.4.7"
  kms_key_arn = "arn:aws:kms:us-east-1:${local.account_code}:key/your-kms-key-id"
  network_type = "IPV4"
  replication_instance_class = "dms.t3.large"
  availability_zone = "us-east-1a"
  multi_az = false
  preferred_maintenance_window = "mon:02:28-mon:02:58"
  publicly_accessible = false
  vpc_security_group_ids = ["sg-xxxxx", "sg-yyyyy"]
  subnet_ids = ["subnet-xxxxx", "subnet-yyyyy"]
}