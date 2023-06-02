variable "queue_name" {
  type        = string
  description = "(Required) A description of the queue's function e.g. 'reprocess-alarms-webjob-parameters'. It forms the first part of the queue name in conjunction with the environment and suffix"
}

variable "environment" {
  type        = string
  description = "(Required) The environment in which the resource exists"
}

variable "storage_account_name" {
  type        = string
  description = "(Required) The name of the storage account that will host the queue"
}

variable "suffix" {
  type        = string
  default     = ""
  description = "(Optional) A suffix to append to the queue name e.g. 'france'"
}

variable "metadata" {
  type        = map(any)
  default     = {}
  description = "(Optional) A mapping of MetaData which should be assigned to this Storage Queue."
}
