variable "group_object_id" {
  type        = string
  description = "Object ID of the user group to add the user to"
}

variable "member_object_id" {
  type        = string
  description = "Object ID of the user to add to the group"
}
