locals {
  output_filepath = "${path.module}/sas_token.txt"
}

resource "null_resource" "blob_sas_token" {
  triggers = {
    always_run = join("-", tolist([var.storage_account_name, var.container_name, var.start, var.expiry, var.permissions]))
  }
  provisioner "local-exec" {
    command     = <<EOT
      ${path.module}/scripts/GenerateContainerSASToken.ps1 `
        -StorageAccountName ${var.storage_account_name} `
        -ContainerName ${var.container_name} `
        -Permissions ${var.permissions} `
        -Start ${var.start} `
        -Expiry ${var.expiry} | Out-File -FilePath ${local.output_filepath} -Encoding utf8
    EOT
    interpreter = ["pwsh", "-Command"]
  }

  lifecycle {
    ignore_changes = [
      triggers
    ]
  }
}
