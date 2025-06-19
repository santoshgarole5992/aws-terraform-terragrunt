output "arn_replication_task" {
  value = aws_dms_replication_task.replication_task[*].replication_task_arn
}