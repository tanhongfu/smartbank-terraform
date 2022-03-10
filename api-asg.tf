resource "aws_autoscaling_group" "api_asg" {
  #availability_zones = ["us-west-1a", "us-west-1c"]
  vpc_zone_identifier  = [aws_subnet.private.id, aws_subnet.private2.id]
  name = "${local.Name}-api-asg"
  desired_capacity   = 2
  max_size           = 2
  min_size           = 2
  target_group_arns = [aws_lb_target_group.api_tg.arn]

  launch_template {
    id      = aws_launch_template.saturn_api_lt.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_api" {
  autoscaling_group_name = aws_autoscaling_group.api_asg.id
  lb_target_group_arn = aws_lb_target_group.api_tg.arn
}

