resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = var.lbarn
  port              = 80
  protocol          = var.pro

  default_action {
    type             = "forward"
    target_group_arn = var.tg
  }
}