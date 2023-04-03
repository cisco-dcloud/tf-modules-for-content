# The policy parameter in policies is a pathand filename in a github repo
# The following downloads all the files defining the policies from github
data "github_repository_file" "from_file" {
  count = length(var.policies)
  repository          = var.github_repo
  branch              = var.github_branch
  file                = var.policies[count.index].policy
}
#Create policies from downloaded files
resource "aws_iam_policy" "from_file" {
  count = length(var.policies)
  name = var.policies[count.index].policyName
  policy = data.github_repository_file.from_file[count.index].content
}
#Get the created policies as data
data "aws_iam_policy" "all_policies" {
  count = length(var.iamUsers)
  name = var.iamUsers[count.index].policyName
  depends_on = [
    aws_iam_policy.from_file
  ]
}
#Create IAM users 
resource "aws_iam_user" "all_users" {
  count = length(var.iamUsers)
  name = var.iamUsers[count.index].userName
}
#Create key/secret pairs for all users
resource "aws_iam_access_key" "all_users" {
  count = length(var.iamUsers)
  user = aws_iam_user.all_users[count.index].name
}
#Attach policies to all users
resource "aws_iam_user_policy_attachment" "all_users" {
  count = length(var.iamUsers)
  user      = aws_iam_user.all_users[count.index].name
  policy_arn = data.aws_iam_policy.all_policies[count.index].arn
}




