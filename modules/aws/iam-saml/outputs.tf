output "all_saml_roles" {
  value= { for i in range(length(var.iamUsers)) : "role_${i}" => {
      name = aws_iam_role.all_saml_roles[i].name,
      arn = aws_iam_role.all_saml_roles[i].arn,
    } 
  }
}