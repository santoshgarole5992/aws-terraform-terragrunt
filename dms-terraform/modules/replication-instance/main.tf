resource "aws_dms_replication_subnet_group" "dms_replication_subnet_group" {
    replication_subnet_group_description        = "replication subnet group"
    replication_subnet_group_id                 = "${var.application_name}-${var.env}-replication-subnet-group"
    subnet_ids                                  = var.subnet_ids
}

resource "aws_dms_replication_instance" "replication_instance" {
  replication_instance_id           = "${var.application_name}-${var.env}-replication-instance"
  replication_instance_class        = var.replication_instance_class
  allocated_storage                 = var.replication_allocated_storage
  auto_minor_version_upgrade        = var.repl_auto_minor_version_upgrade
  availability_zone                 = var.availability_zone
  engine_version                    = var.repl_engine_version
  kms_key_arn                       = var.kms_key_arn
  multi_az                          = var.multi_az
  preferred_maintenance_window      = var.preferred_maintenance_window
  publicly_accessible               = var.publicly_accessible
  network_type                      = var.network_type
 replication_subnet_group_id        = aws_dms_replication_subnet_group.dms_replication_subnet_group.id
  vpc_security_group_ids            = var.vpc_security_group_ids
 depends_on                         = [ aws_dms_replication_subnet_group.dms_replication_subnet_group ]
}