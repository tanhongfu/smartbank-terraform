resource "aws_lb" "alb" {
  name               = "saturn-alb"
  internal           = false
  load_balancer_type = var.lb_type[0]
  security_groups    = [aws_security_group.sg.id]
  subnets            = [aws_subnet.public.id, aws_subnet.public2.id]

  enable_deletion_protection = false
}

resource "aws_lb_listener" "api_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "3000"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_tg.arn
  }
}

resource "aws_lb_target_group" "api_tg" {
  name     = "saturn-api-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.saturn_vpc.id
}

/*resource "aws_alb_listener_rule" "api_rule" {
  listener_arn = aws_lb_listener.api_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_tg.arn
  }

  condition {
    path_pattern {
      values = ["/api/*"]
    }
  }
} */

#resource "aws_lb_target_group_attachment" "api_tg" {
#target_group_arn = aws_lb_target_group.api_tg.arn
#target_id        = aws_instance.instance.id # how to get instance id from launch template
#port             = 80
#}

resource "aws_lb_listener" "react_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.react_tg.arn
  }
}

resource "aws_lb_target_group" "react_tg" {
  name     = "saturn-react-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.saturn_vpc.id
}

/*resource "aws_alb_listener_rule" "react_rule" {
  listener_arn = aws_lb_listener.react_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.react_tg.arn
  }

  condition {
    path_pattern {
      values = ["/welcome/*"]
    }
  }
} */

#resource "aws_lb_target_group_attachment" "react_tg" {
# target_group_arn = aws_lb_target_group.react_tg.arn
# target_id        = aws_instance.instance.id # how to get instance id from launch template
# port             = 3000
#}

//access_logs {
//bucket  = aws_s3_bucket.lb_logs.bucket
//prefix  = "test-lb"
//enabled = true
//}

#tags = {
#"market" = local.market
# "product" = local.product
#"application" = local.application
# "environment" = local.environment
#}
#}