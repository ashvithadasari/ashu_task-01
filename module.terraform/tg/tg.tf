resource "aws_lb_target_group" "demo_tg" {
  name        = var.tgname
  port        = 80
  protocol    = "HTTP"
  target_type = var.instances
  
                             # Can be "ip" or "lambda"
  vpc_id      = var.vpcidd

  health_check {
    enabled             = true
    interval            = 30
    path                = var.path
    port                = "traffic-port"
    protocol            = var.protocal
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200-399"
  }
}

