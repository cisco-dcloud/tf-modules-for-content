variable "policies" {
  type        = list(object({
    policy       = string
    policyName   = string
  }))
  description = "List of policies"
  default = []
}


########
#GITHUB
########

variable "github_token" {
  type        = string
  description = "Github token. Can also be provided using env GITHUB_TOKEN "
}

variable "github_branch" {
  type        = string
  description = "Github branch "
  default = "master"
}
