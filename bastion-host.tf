module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  #version = "~> 3.0"

  name = "${local.Name}-bastion-host"

  ami                    = data.aws_ami.aws_linux_2.id
  instance_type          = var.instance_type
  #user_data = join("\n", [file("docker_nginx.sh"), file("install-ssm.sh")])
  key_name               = "SaturnOwnAccountKP"
  #monitoring             = true
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = aws_subnet.public.id
  associate_public_ip_address = true
} 


