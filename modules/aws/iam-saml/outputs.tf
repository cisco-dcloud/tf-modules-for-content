##########################
# SAML
##########################

output "saml_roles_names" {
  value = aws_iam_role.all_saml_roles.*.name
}

output "saml_roles_arn" {
  value = aws_iam_role.all_saml_roles.*.arn
}