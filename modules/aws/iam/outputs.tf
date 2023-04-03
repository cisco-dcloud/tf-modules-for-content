output "access_keys" {
  value = aws_iam_access_key.all_users.*.id
}
output "access_secrets" {
  value = aws_iam_access_key.all_users.*.secret
}
output "users_name" {
  value = aws_iam_user.all_users.*.name
}
output "users_arn" {
  value = aws_iam_user.all_users.*.arn
}

