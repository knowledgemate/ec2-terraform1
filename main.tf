provider "aws" {
  region     = "ap-southeast-2"
  access_key = "xxxxxxxxxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxx"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-016eb5d644c333ccb"
  instance_type          = "t2.micro"
  key_name               = "projecttest"
  monitoring             = true
  vpc_security_group_ids = ["sg-0f7eda73f83528e0d"]
  subnet_id              = "subnet-0f996319c2fcd0d9d"
  
  tags = {
    Name = "terraform-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}
