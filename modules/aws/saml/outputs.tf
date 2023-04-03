##########################
# SAML
##########################

output "saml_demouser_role" {
  value = aws_iam_role.saml_demouser.arn
}