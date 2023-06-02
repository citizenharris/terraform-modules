data "local_file" "sas_token" {
  filename   = local.output_filepath
  depends_on = [null_resource.blob_sas_token]
}

output "sas_url_query_string" {
  value     = "${var.storage_resource_url}${var.container_name}${data.local_file.sas_token.content}"
  sensitive = true
}
