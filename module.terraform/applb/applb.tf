resource "aws_lb" "app_alb" {
  name               = var.lbname
  internal           = var.value
  load_balancer_type = var.type
  security_groups    = var.sggroup
  subnets            = var.subnets

  enable_deletion_protection = false

}
