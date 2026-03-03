resource "aws_lb_target_group_attachment" "tga" {
    
  target_group_arn = var.tgarn
  target_id        = var.instanceid
  port             = 80
} 
