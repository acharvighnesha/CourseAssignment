module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "bastion"

  ami                    = "ami-08c40ec9ead489470"
  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [module.sg_ssh.security_group_id]
  subnet_id              = module.vpc.public_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "bastion"
  }
}