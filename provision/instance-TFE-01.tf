
resource "aws_instance" "tfe-01" {
  ami           = var.AMI_ID
  instance_type = "t3.xlarge"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "50"
    delete_on_termination = "true"
  }

  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name = "tfe-deploy"

  tags = {
      Name      = "tfe-server"
      proj      = "tfe-deploy"
  }

}
