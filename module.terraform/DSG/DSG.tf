resource "aws_default_security_group" "defaultsg" {
  vpc_id = var.vpcid

tags = {
  Name = var.sgname
}


 ingress {
    protocol  = -1
    from_port = 0
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
}