# The policy parameter in policies is a pathand filename in a github repo
# The following downloads all the files defining the policies from github
# data "github_repository_file" "from_file" {
#   count        = length(var.policies)
#   repository   = "tf-projects-for-content"
#   branch       = var.policy_github_branch
#   file         = "policies/aws/${var.policies[count.index].policy}"
# }


data "http" "github" {
  count        = length(var.policies)
  url = "https://raw.githubusercontent.com/cisco-dcloud/tf-projects-for-content/main/policies/aws/${var.policies[count.index].policy}?ref=${var.policy_github_branch}"
  request_headers = {
    Accept = "application/vnd.github+json"
  }
}


#Create policies from downloaded files
resource "aws_iam_policy" "all_policies" {
  count  = length(var.policies)
  name   = var.policies[count.index].policyName
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "VisualEditor0",
          "Effect": "Allow",
          "Action": [
            "ec2:Describe*",
            "ec2:List*"
          ],
          "Resource": "*",
          "Condition": {
              "StringEquals": {
                  "aws:RequestedRegion": "us-east-1"
              }
          }
      }
  ]
}
EOF
  path   = "/dcloud-automation/"
}

