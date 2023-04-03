
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ec2" {
  ami                        = data.aws_ami.amazon-linux-2.id
  instance_type               = "t1.micro"
  subnet_id                   = var.vpc.private_subnets[0]
  tags = {
    "idacRequestId" = "${var.demo_id}"
    "name" = "${var.name}"
  }

}
