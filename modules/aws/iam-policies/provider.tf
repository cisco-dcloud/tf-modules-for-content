terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = var.github_token # or `GITHUB_TOKEN`
  base_url = "https://www-github.cisco.com/" # or GITHUB_BASE_URL ex: https://terraformtesting-ghe.westus.cloudapp.azure.com/
  owner = "GDE-Content-Engineering" # or GITHUB_OWNER this is the organization (or owner of the repo)
}