locals {
  # Fully qualified name
  full_name = "${replace(replace(var.application_name, " ", ""), "-", "")}${var.environment}${var.suffix}"

  # Fully qualified name with shortened environment (stag vs staging)
  shortened_env_name = length(local.full_name) > 21 ? replace(local.full_name, var.environment, substr(var.environment, 0, 4)) : local.full_name

  # Fully qualified name with shortened environment and application name (down vs downtime-api)
  shortened_app_name = length(local.shortened_env_name) > 21 ? replace(local.shortened_env_name, var.application_name, substr(var.application_name, 0, 4)) : local.shortened_env_name

  # Fully qualified name with shortened environment, application name, and suffix (fran vs france)
  shortened_suffix_name = length(local.shortened_app_name) > 21 ? replace(local.shortened_app_name, var.suffix, substr(var.suffix, 0, 4)) : local.shortened_app_name
  final_name            = lower("st${local.shortened_suffix_name}")
}

resource "azurerm_storage_account" "this" {
  # Name can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long
  name                      = local.final_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  account_kind              = var.account_kind
  access_tier               = var.access_tier
  enable_https_traffic_only = var.enable_https_traffic_only
  min_tls_version           = var.min_tls_version
  allow_blob_public_access  = var.allow_blob_public_access
  is_hns_enabled            = var.is_hns_enabled
  nfsv3_enabled             = var.nfsv3_enabled

  dynamic "custom_domain" {
    for_each = var.custom_domain == null ? [] : [true]

    content {
      name          = var.custom_domain["name"]
      use_subdomain = try(var.custom_domain["use_subdomain"], null)
    }
  }

  dynamic "identity" {
    for_each = var.identity == null ? [] : [true]

    content {
      type         = var.identity["type"]
      identity_ids = try(var.identity["identity_ids"], null)
    }
  }

  dynamic "blob_properties" {
    for_each = var.blob_properties == null ? [] : [true]

    content {
      delete_retention_policy {
        days = var.delete_retention_policy
      }

      container_delete_retention_policy {
        days = var.container_delete_retention_policy
      }

      versioning_enabled       = try(var.blob_properties["versioning_enabled"], false)
      change_feed_enabled      = try(var.blob_properties["change_feed_enabled"], false)
      last_access_time_enabled = try(var.blob_properties["last_access_time_enabled"], false)
      default_service_version  = try(var.blob_properties["default_service_version"], "2020-06-12")

      dynamic "cors_rule" {
        for_each = lookup(var.cors_rules, "blob", null) == null ? [] : [true]

        content {
          allowed_headers    = try(var.cors_rules["blob"]["allowed_headers"], null)
          allowed_methods    = try(var.cors_rules["blob"]["allowed_methods"], null)
          allowed_origins    = try(var.cors_rules["blob"]["allowed_origins"], null)
          exposed_headers    = try(var.cors_rules["blob"]["exposed_headers"], null)
          max_age_in_seconds = try(var.cors_rules["blob"]["max_age_in_seconds"], null)
        }
      }
    }
  }

  dynamic "queue_properties" {
    for_each = var.logging == null ? [] : [true]

    content {
      logging {
        delete                = try(var.logging["delete"], null)
        read                  = try(var.logging["read"], null)
        version               = try(var.logging["version"], null)
        write                 = try(var.logging["write"], null)
        retention_policy_days = try(var.logging["retention_policy_days"], 7)
      }
    }
  }

  dynamic "queue_properties" {
    for_each = lookup(var.cors_rules, "queue", null) == null ? [] : [true]

    content {
      cors_rule {
        allowed_headers    = try(var.cors_rules["queue"]["allowed_headers"], null)
        allowed_methods    = try(var.cors_rules["queue"]["allowed_methods"], null)
        allowed_origins    = try(var.cors_rules["queue"]["allowed_origins"], null)
        exposed_headers    = try(var.cors_rules["queue"]["exposed_headers"], null)
        max_age_in_seconds = try(var.cors_rules["queue"]["max_age_in_seconds"], null)
      }
    }
  }

  dynamic "queue_properties" {
    for_each = var.minute_metrics == null ? [] : [true]

    content {
      minute_metrics {
        enabled               = true
        version               = var.minute_metrics["version"]
        include_apis          = try(var.minute_metrics["include_apis"], null)
        retention_policy_days = try(var.minute_metrics["retention_policy_days"], 7)
      }
    }
  }

  dynamic "queue_properties" {
    for_each = var.hour_metrics == null ? [] : [true]

    content {
      hour_metrics {
        enabled               = true
        version               = var.hour_metrics["version"]
        include_apis          = try(var.hour_metrics["include_apis"], null)
        retention_policy_days = try(var.hour_metrics["retention_policy_days"], 7)
      }
    }
  }

  dynamic "static_website" {
    for_each = var.static_website == null ? [] : [true]

    content {
      index_document     = try(var.static_website["index_document"], null)
      error_404_document = try(var.static_website["error_404_document"], null)
    }
  }

  large_file_share_enabled = var.large_file_share_enabled

  routing {
    publish_internet_endpoints  = var.publish_internet_endpoints
    publish_microsoft_endpoints = var.publish_microsoft_endpoints
    choice                      = var.choice
  }

  tags = var.tags
}
