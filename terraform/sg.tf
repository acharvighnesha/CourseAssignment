module "sg-private" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sg-ssh"
  description = "Security group jenkins and applications"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 80
      protocol    = "tcp"
      description = "ssh ports"
      cidr_blocks = aws_vpc.vighnesha.cidr_block
    }
  ]
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}


module "sg-ssh" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sg-ssh"
  description = "Security group for ssh into bastion"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 80
      protocol    = "tcp"
      description = "ssh ports"
      cidr_blocks = "0.0.0.0/16"
    }
  ]
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}