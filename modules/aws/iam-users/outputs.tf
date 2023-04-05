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

output "all_users" {
  value= { for i in range(count(var.iamUsers)) : "user_${i}" => {
      name = aws_iam_user.all_users[i].name,
      arn = aws_iam_user.all_users[i].arn,
      key = aws_iam_access_key.all_users[i].id
      secret = aws_iam_access_key.all_users[i].secret
    } 
  }
}




# {
#   user1 = {
#   "name"=userName1
#   "arn"= useArn1
#   "key"= iserKey1
#   "secret" = userSecret1
#   },
#   user2 = {
#   "name"=userName2
#   "arn"= useArn2
#   "key"= iserKey2
#   "secret" = userSecret2
#   },
# }