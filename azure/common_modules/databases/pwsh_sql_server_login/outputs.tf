output "user_password" {
  value = random_password.password.result
}

output "username" {
  value = var.login_name
}
