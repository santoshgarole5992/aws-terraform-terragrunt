output "replication_instance_arn" {
  description = "The ARN of the replication instance"
  value       = aws_dms_replication_instance.replication_instance.id
} 

output "subnet_group_id" {
  value = aws_dms_replication_subnet_group.dms_replication_subnet_group.replication_subnet_group_id
}