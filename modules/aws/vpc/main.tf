# -----------------------------
# April 2022
# ver 5.1, rajeshvs@cisco
# 
#------------------------------
# pick the first AZ #
data "aws_availability_zones" "available" {
  state = "available"
}

# create VPC  
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name                             = "${var.demo_id}-vpc"
  cidr                             = "10.0.0.0/16"
  azs                              = [data.aws_availability_zones.available.names[0]]
  private_subnets                  = ["10.0.11.0/24"]
  public_subnets                   = ["10.0.0.0/24"]
  intra_subnets                    = ["10.0.21.0/24"]
  enable_nat_gateway               = true
  single_nat_gateway               = true
}


