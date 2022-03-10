/*data "aws_ami_ids" "saturn-react" {
  #most_recent = true
  owners      = ["040187859603"]
  #region      = var.region

   filter {
    name                = "name"
    values              = ["040187859603/Saturn-reactAMI-*"]
 }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

} */

data "aws_ami" "aws_linux_2" {
  #executable_users = ["self"]
  most_recent = true
  #name_regex       = "^myami-\\d{3}"
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20220218.1-x86_64-gp2"]
    #values = ["amazon/amzn2-ami-kernel-*-*-x86_64-gp2-*"]
    #values = ["amzn2-ami-kernel-hvm-*-x86_64-gp2"]
    # amazon/amzn2-ami-kernel-5.10-hvm-2.0.20220218.1-x86_64-gp2
    # values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
    
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}