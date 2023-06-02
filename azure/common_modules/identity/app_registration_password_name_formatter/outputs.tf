locals {
  # applicationKeyIdentifierValue cannot be more than 32 bytes
  full_name                  = "${var.display_name}-${var.environment}${var.suffix == "" ? "" : "-${var.suffix}"}"
  name_with_shortened_env    = length(local.full_name) > 31 ? replace(local.full_name, var.environment, substr(var.environment, 0, 4)) : local.full_name
  name_with_shortened_suffix = length(local.name_with_shortened_env) > 31 ? replace(local.name_with_shortened_env, var.suffix, substr(var.suffix, 0, 4)) : local.name_with_shortened_env
  final_name                 = length(local.name_with_shortened_suffix) > 31 ? substr(local.name_with_shortened_suffix, 0, 32) : local.name_with_shortened_suffix
}

output "name" {
  value = local.final_name
}
