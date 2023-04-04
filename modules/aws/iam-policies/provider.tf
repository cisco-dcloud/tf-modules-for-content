terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.19"
    }
  }
}

provider "github" {
  owner = "cisco-dcloud" # or GITHUB_OWNER this is the organization (or owner of the repo)
  token = policy_github_token #var.policy_github_token # or `GITHUB_TOKEN`
  base_url = "https://github.com/" # or GITHUB_BASE_URL ex: https://terraformtesting-ghe.westus.cloudapp.azure.com/
  
}