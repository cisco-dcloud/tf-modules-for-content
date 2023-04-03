variable "child_account" {
  type        = string
  description = "AWS Child Account Number "
}

variable "samlRoles" {
  type        = list(object({
    roleName     = string
    policyName   = string
  }))
  description = "List of roles and their policies"
  default = []
}
