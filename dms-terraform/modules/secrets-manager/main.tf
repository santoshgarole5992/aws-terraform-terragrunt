resource "aws_secretsmanager_secret" "source_secret_manager" {
  name          = var.secret_name
  description   = "Secret for DMS Source DB endpoint credentials"
}

resource "aws_secretsmanager_secret_version" "source_secret_manager_version" {
  secret_id     = aws_secretsmanager_secret.source_secret_manager.id
  secret_string = jsonencode({
    username    = var.username
    password    = var.password
  })
}
