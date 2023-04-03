# │ Earlier versions of Terraform used empty provider blocks ("proxy provider configurations") for child modules to declare their need to be
# │ passed a provider configuration by their callers. That approach was ambiguous and is now deprecated.
# │ 
# │ If you control this module, you can migrate to the new declaration syntax by removing all of the empty provider "aws" blocks and then
# │ adding or updating an entry like the following to the required_providers block of module.ssh-key:
# │     aws = {
# │       source = "hashicorp/aws"
# │     }


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}