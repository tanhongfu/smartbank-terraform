resource "aws_launch_template" "saturn_react_lt" {
  name = "Saturn-LT-React2"

  #block_device_mappings {
    #device_name = "/dev/sda1"

    #ebs {
     # volume_size = 20
    #}
  #}

  #capacity_reservation_specification {
  #capacity_reservation_preference = "open"
  #}

  #cpu_options {
    #core_count       = 4
   # threads_per_core = 2
  #}

  #credit_specification {
  # cpu_credits = "standard"
  #}

  #disable_api_termination = false

  #ebs_optimized = true

  #elastic_gpu_specifications {
  #  type = "test"
  #}

  #elastic_inference_accelerator {
  # type = "eia1.medium"
  #}

  iam_instance_profile {
    name = "AllowSessionManager"
  }

  image_id = data.aws_ami.aws_linux_2.id

  instance_initiated_shutdown_behavior = "terminate"

  #instance_market_options {
  #  market_type = "spot"
  #}

  instance_type = var.instance_type

  #kernel_id = "test"

  key_name = "SaturnOwnAccountKP"

  #license_specification {
  #license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
  #}

  #metadata_options {
  # http_endpoint               = "enabled"
  #http_tokens                 = "required"
  #http_put_response_hop_limit = 1
  #instance_metadata_tags      = "enabled"
  #}

  # maybe might need later - but higher cost 
  #monitoring {
  #enabled = true
  #}

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.sg.id]
    subnet_id       = aws_subnet.private.id
    #subnet_id = output.private_subnet_id.id
  }

  #placement {
  #  availability_zone = "us-west-2a"
  #}

  #ram_disk_id = "test"

  #vpc_security_group_ids = [aws_security_group.sg.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${local.Name}-react-lt"
      Terraform = true
    }
  }

  user_data = join("\n", [filebase64("react-userdata.sh"), filebase64("cloudwatch-agent.sh")])
  #user_data = "${base64encode(data.template_file.test.rendered)}"
  #user_data = filebase64("${path.module}/example.sh")
}

