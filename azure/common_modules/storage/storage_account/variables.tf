variable "application_name" {
  type        = string
  description = "(Required) Name of the application linked to this storage account"
}

variable "environment" {
  type        = string
  description = "(Required) Target environment for the resource (i.e. development, test, staging, production)"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "(Optional) Tags to be attached to the storage account"
}

variable "suffix" {
  type        = string
  default     = ""
  description = "(Optional) Suffix to be appended to storage account name"
}

variable "resource_group_name" {
  type        = string
  description = "(Required) Resource group name for a container"
}

variable "location" {
  type        = string
  description = "(Required) Storage account Azure region, e.g. West Europe"
}

variable "account_kind" {
  type        = string
  default     = "StorageV2"
  description = "(Optional) Defines the Kind of account. Valid options are `BlobStorage`, `BlockBlobStorage`, `FileStorage`, `Storage` and `StorageV2`. Changing this forces a new resource to be created. Defaults to `StorageV2`."
}

variable "account_tier" {
  type        = string
  description = "(Required) Defines the Tier to use for this storage account. Valid options are `Standard` and `Premium`. For `BlockBlobStorage` and `FileStorage` account kinds only `Premium` is valid. Changing this forces a new resource to be created."
}

variable "account_replication_type" {
  type        = string
  description = "(Required) Defines the type of replication to use for this storage account. See https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy for details. Valid options are `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS` and `RAGZRS`. Changing this forces a new resource to be created when types `LRS`, `GRS` and `RAGRS` are changed to `ZRS`, `GZRS` or `RAGZRS` and vice versa."
}

variable "access_tier" {
  type        = string
  default     = "Hot"
  description = "(Optional) Defines the access tier for `BlobStorage`, `FileStorage` and `StorageV2` accounts. Valid options are `Hot` and `Cool`, defaults to `Hot`"
}

variable "enable_https_traffic_only" {
  type        = bool
  default     = true
  description = "(Optional) Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true."
}

variable "min_tls_version" {
  type        = string
  default     = "TLS1_0"
  description = "(Optional) The minimum supported TLS version for the storage account. Possible values are `TLS1_0`, `TLS1_1`, and `TLS1_2`. Defaults to `TLS1_0` for new storage accounts."
}

variable "allow_blob_public_access" {
  type        = bool
  default     = false
  description = "(Optional) Allow or disallow public access to all blobs or containers in the storage account. Defaults to false."
}

variable "is_hns_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2 (for more information: https://docs.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-quickstart-create-account). Changing this forces a new resource to be created. NOTE: This can only be true when account_tier is `Standard` or when account_tier is `Premium` and account_kind is `BlockBlobStorage`"
}
variable "nfsv3_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Is NFSv3 protocol enabled? Changing this forces a new resource to be created. Defaults to false."
}

variable "custom_domain" {
  type = object({
    name          = string
    use_subdomain = bool
  })
  default     = null
  description = "(Optional) A custom_domain block containing name and use_subdomain. name: (Required) The Custom Domain Name to use for the Storage Account, which will be validated by Azure. use_subdomain: (Optional) Should the Custom Domain Name be validated by using indirect CNAME validation?"
}

variable "identity" {
  type = object({
    type         = string
    identity_ids = list(string)
  })
  default     = null
  description = "(Optional) An identity block contains a type and identity_ids. type: (Required) Specifies the identity type of the Storage Account. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both).  NOTE: The assigned principal_id and tenant_id can be retrieved after the identity type has been set to `SystemAssigned` and Storage Account has been created. identity_ids: (Optional) A list of IDs for User Assigned Managed Identity resources to be assigned. NOTE: This is required when type is set to `UserAssigned` or `SystemAssigned, UserAssigned`."
}

variable "cors_rules" {
  type = object({
    blob = object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(number)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    })
    queue = object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(number)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    })
  })
  default = {
    blob  = null
    queue = null
  }
  description = "(Optional) There are two properties to allow for different CORS rules for blob or queue storage. If one is not necessary you can assign it to null. allowed_headers - (Required) A list of headers that are allowed to be a part of the cross-origin request. allowed_methods - (Required) A list of http headers that are allowed to be executed by the origin. Valid options are `DELETE`, `GET`, `HEAD`, `MERGE`, `POST`, `OPTIONS`, `PUT` or `PATCH`. allowed_origins - (Required) A list of origin domains that will be allowed by CORS. exposed_headers - (Required) A list of response headers that are exposed to CORS clients. max_age_in_seconds - (Required) The number of seconds the client should cache a preflight response."
}

variable "delete_retention_policy" {
  type        = number
  default     = 7
  description = "(Optional) Specifies the number of days that the blob should be retained, between 1 and 365 days. Defaults to 7."
}

variable "container_delete_retention_policy" {
  type        = number
  default     = 7
  description = "(Optional) Specifies the number of days that the container should be retained, between 1 and 365 days. Defaults to 7."
}

variable "blob_properties" {
  type = object({
    versioning_enabled       = bool
    change_feed_enabled      = bool
    default_service_version  = string
    last_access_time_enabled = bool
  })
  default     = null
  description = "(Optional). An object containing versioning_enabled - (Optional) Is versioning enabled? Defaults to false. change_feed_enabled - (Optional) Is the blob service properties for change feed events enabled? Defaults to false. default_service_version - (Optional) The API Version which should be used by default for requests to the Data Plane API if an incoming request doesn't specify an API Version. Defaults to `2020-06-12`. last_access_time_enabled - (Optional) Is the last access time based tracking enabled? Defaults to false."
}

variable "logging" {
  type = object({
    delete                = bool
    read                  = bool
    write                 = bool
    version               = string
    retention_policy_days = number
  })
  default     = null
  description = "(Optional) Part of the queue properties. Defines how requests are logged, any change to required properties forces a new resource. Properties: delete - (Required) Indicates whether all delete requests should be logged. read - (Required) Indicates whether all read requests should be logged. version - (Required) The version of storage analytics to configure. write - (Required) Indicates whether all write requests should be logged. retention_policy_days - (Optional) Specifies the number of days that logs will be retained."
}

variable "minute_metrics" {
  type = object({
    version               = string
    include_apis          = bool
    retention_policy_days = number
  })
  default     = null
  description = "(Optional) Part of the queue properties. Defines how minute metrics are captures, any change to required properties, or retention_policy_days, forces a new resource. Properties: enabled - (Required) Indicates whether minute metrics are enabled for the Queue service. version - (Required) The version of storage analytics to configure. include_apis - (Optional) Indicates whether metrics should generate summary statistics for called API operations. retention_policy_days - (Optional) Specifies the number of days that logs will be retained."
}

variable "hour_metrics" {
  type = object({
    version               = string
    include_apis          = bool
    retention_policy_days = number
  })
  default     = null
  description = "(Optional) Part of the queue properties. Defines how hour metrics are captures, any change to required properties, or retention_policy_days, forces a new resource. Properties: enabled - (Required) Indicates whether minute metrics are enabled for the Queue service. version - (Required) The version of storage analytics to configure. include_apis - (Optional) Indicates whether metrics should generate summary statistics for called API operations. retention_policy_days - (Optional) Specifies the number of days that logs will be retained."
}

variable "static_website" {
  type = object({
    index_document     = string
    error_404_document = string
  })
  default     = null
  description = "(Optional) Settings for using a blob container as a static website. Properties: index_document - (Optional) The webpage that Azure Storage serves for requests to the root of a website or any subfolder. For example, `index.html`. The value is case-sensitive. error_404_document - (Optional) The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file. NOTE: static_website can only be set when the account_kind is set to `StorageV2` or `BlockBlobStorage`."
}

variable "large_file_share_enabled" {
  type        = bool
  default     = null
  description = "(Optional) Enables the storage account for file shares spanning up to 100 TiB. Enabling this feature will limit your storage account to only locally redundant and zone redundant storage options. Once a GPv2 storage account has been enabled for large file shares, you cannot disable the large file share capability. FileStorage storage accounts (storage accounts for premium file shares) do not have this option, as all premium file shares can scale up to 100 TiB."
}

variable "publish_internet_endpoints" {
  type        = bool
  default     = false
  description = "(Optional) Should internet routing storage endpoints be published? Defaults to false."
}

variable "publish_microsoft_endpoints" {
  type        = bool
  default     = false
  description = " (Optional) Should microsoft routing storage endpoints be published? Defaults to false."
}

variable "choice" {
  type        = string
  default     = "MicrosoftRouting"
  description = "(Optional) Specifies the kind of network routing opted by the user. Possible values are `InternetRouting` and `MicrosoftRouting`. Defaults to `MicrosoftRouting`."
}
