variable "child_account" {
  type        = string
  description = "AWS Child Account Number "
}

variable "saml_provider_name" {
  type        = string
  description = "Name of SAML provider"
  default = "idp.cat-dcloud.com"
}

variable "saml_idp_metadata" {
  type        = string
  description = "File that contains IDP metadata"
  default = "idp.cat-dcloud.com.xml"
}

variable "saml_provider" {
  type        = bool
  description = "Configure SAML provider or not"
  default = true
}

variable "load_policy_from_file" {
  type        = bool
  description = "Policy from file. If false, data source will be used."
  default = false
}

variable "saml_user_policy_from_file" {
  type        = string
  description = "Policy defining SAML based access"
  default = "policy_user.json"
}

variable "saml_user_policy_from_data_source" {
  type        = string
  description = "Policy defining SAML based access"
  default = "ReadOnlyAccess"
}






variable "samlRoles" {
  type        = list(object({
    roleName     = string
    policyName   = string
  }))

  description = "List of roles and their policies"
  default = []
}
