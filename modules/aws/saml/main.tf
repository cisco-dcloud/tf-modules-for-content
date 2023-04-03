resource "aws_iam_saml_provider" "cat-idp" {
  count = var.saml_provider ? 1 : 0
  name                   = var.saml_provider_name
  saml_metadata_document = file("${path.module}/${var.saml_idp_metadata}")
}

resource "aws_iam_role" "saml_demouser" {
    name = "saml_demouser"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::${var.child_account}:saml-provider/${var.saml_provider_name}"
      },
      "Action": "sts:AssumeRoleWithSAML",
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "saml_demouser" {
    count = var.load_policy_from_file ? 1 : 0
    name        = "saml_demouser"
    role = "${aws_iam_role.saml_demouser.id}"
    policy = file("${path.module}/${var.saml_user_policy_from_file}")
}

data "aws_iam_policy" "readOnly" {
  name = var.saml_user_policy_from_data_source
}

resource "aws_iam_role_policy_attachment" "saml_demouser" {
  count = var.load_policy_from_file ? 0 : 1
  role       = aws_iam_role.saml_demouser.id
  policy_arn = data.aws_iam_policy.readOnly.arn
}

