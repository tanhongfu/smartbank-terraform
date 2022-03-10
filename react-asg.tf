resource "aws_autoscaling_group" "react_asg" {
  #availability_zones = ["us-west-1a", "us-west-1c"]
  vpc_zone_identifier  = [aws_subnet.private.id, aws_subnet.private2.id]
  name = "${local.Name}-react-asg"
  desired_capacity   = 2
  max_size           = 2
  min_size           = 2
  target_group_arns = [aws_lb_target_group.react_tg.arn]

  launch_template {
    id      = aws_launch_template.saturn_react_lt.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_react" {
  autoscaling_group_name = aws_autoscaling_group.react_asg.id
  lb_target_group_arn = aws_lb_target_group.react_tg.arn
}

