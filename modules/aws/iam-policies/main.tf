# The policy parameter in policies is a pathand filename in a github repo
# The following downloads all the files defining the policies from github
data "github_repository_file" "from_file" {
  count = length(var.policies)
  repository          = "terraform-for-demo-content"
  branch              = var.policy_github_branch
  file                = "cloud/aws/policies/${var.policies[count.index].policy}"
}

#Create policies from downloaded files
resource "aws_iam_policy" "all_policies" {
  count = length(var.policies)
  name = var.policies[count.index].policyName
  policy = data.github_repository_file.from_file[count.index].content
}

