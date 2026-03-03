resource "aws_lb_listener_rule" "rule1" {
  listener_arn = var.listarn
  priority     = var.pri


  condition {
    path_pattern {
      values = var.patterns
    }
  }

  # Action: Forward to a target group
  action {
    type             = "forward"
    target_group_arn = var.tgarn1
  }
}