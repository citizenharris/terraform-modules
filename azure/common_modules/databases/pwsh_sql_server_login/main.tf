resource "random_password" "password" {
  length      = 16
  special     = false
  lower       = true
  number      = true
  upper       = true
  min_lower   = 1
  min_numeric = 1
  min_upper   = 1
}

# Best practice is to specify what this module depends on in the application layer
resource "null_resource" "sql_login" {

  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command     = <<EOT
      ${path.module}/scripts/AddSqlLogin.ps1 `
        -SqlServerName "${var.sql_server_name}" `
        -AdminUserName "${var.admin_username}" `
        -AdminPassword "${var.admin_password}" `
        -LoginName "${var.login_name}" `
        -LoginPassword "${random_password.password.result}"
    EOT
    interpreter = ["pwsh", "-Command"]
  }
}
