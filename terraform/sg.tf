module "sg-private" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sg-private"
  description = "Security group jenkins and applications"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 80
      protocol    = "tcp"
      description = "ssh ports"
      cidr_blocks = module.vpc.cidr_block
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      description = "outbound traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
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
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      description = "outbound traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}