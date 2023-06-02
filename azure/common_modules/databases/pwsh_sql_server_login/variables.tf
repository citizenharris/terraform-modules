variable "login_name" {
  type        = string
  description = "The name of the database user"
}

variable "sql_server_name" {
  type        = string
  description = "The server instance for the Server Login"
}

variable "admin_username" {
  type        = string
  description = "The name of an SQL user with permissions to create logins"
}

variable "admin_password" {
  type        = string
  description = "The password for the SQL user with permissions to create logins"
}
