resource "aws_dms_replication_task" "replication_task" {
  count                       = length(var.db_list)
  migration_type              = var.migration_type
  replication_instance_arn    = var.replication_instance_arn
  replication_task_id         = "${replace(var.db_list[count.index], "_", "-")}-${var.env}-replication-task"
  replication_task_settings   = var.replication_task_settings
  table_mappings              = var.table_mappings
  start_replication_task      = var.start_replication_task
  source_endpoint_arn         = var.source_endpoint_arn
  target_endpoint_arn         = var.target_endpoint_arn
}