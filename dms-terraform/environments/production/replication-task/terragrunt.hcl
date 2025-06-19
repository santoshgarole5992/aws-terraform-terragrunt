terraform {
  source = "../../../modules/replication-task"
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
  db_list                        = ["sample-db"]
  migration_type                 = "full-load-and-cdc"
  env                            = "production"
  replication_task_settings_file = "task_settings.json"
}
