output "policies_name" {
  value = aws_iam_policy.all_policies.*.name
}

output "policies_arn" {
  value = aws_iam_policy.all_policies.*.arn
}

output "policies_github" {
  value = data.github_repository_file.from_file.*.content
}

