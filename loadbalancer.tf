resource "aws_lb" "LB" {
  name               = "ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.SG.id]
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  tags = {
    Name = "ALB"
  }
}

resource "aws_lb_target_group" "TG" {
  name     = "ALB-TG"
  vpc_id   = aws_vpc.vpc.id
  port     = "80"
  protocol = "HTTP"

  health_check {
    path = "/"
    port = "traffic-port"
  }

  tags = {
    Name = "ALB-TG"
  }
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.TG.arn
  target_id        = aws_instance.instance1.id
  port             = "80"

}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.TG.arn
  target_id        = aws_instance.instance2.id
  port             = "80"

}

resource "aws_lb_listener" "LS" {
  load_balancer_arn = aws_lb.LB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.TG.arn
    type             = "forward"
  }

}