module "ec2_private_1"{
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "jenkins"

  ami                    = "ami-08c40ec9ead489470"
  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [module.sg_private.security_group_id]
  subnet_id              = module.vpc.private_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "jenkins"
  }
}

module "ec2_private_2"{
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "application"

  ami                    = "ami-08c40ec9ead489470"
  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [module.sg_private.security_group_id]
  subnet_id              = module.vpc.private_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "app"
  }
}