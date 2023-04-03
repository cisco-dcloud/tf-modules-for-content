variable "policies" {
  type        = list(object({
    policy       = string
    policyName   = string
  }))
  description = "List of policies"
  default = []
}

variable "iamUsers" {
  type        = list(object({
    userName     = string
    policyName   = string
  }))
  description = "List of users and their policies"
  default = []
}

########
#GITHUB
########

variable "github_token" {
  type        = string
  description = "Github token. Can also be provided using env GITHUB_TOKEN "
}

variable "github_url" {
  type        = string
  description = "Github base URL. Can also be provided using env GITHUB_BASE_URL "
  default = "https://www-github.cisco.com/"
}

variable "github_org" {
  type        = string
  description = "Github base URL. Can also be provided using env GITHUB_OWNER "
  default = "GDE-Content-Engineering"
}

variable "github_repo" {
  type        = string
  description = "Github Repo "
  default = "terraform-for-demo-content"
}

variable "github_branch" {
  type        = string
  description = "Github branch "
  default = "master"
}
