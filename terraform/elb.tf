resource "aws_alb" "my_alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_web.id]
  subnets            = [aws_subnet.my_subnet1.id, aws_subnet.my_subnet2.id]
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    #type             = "forward"
    #target_group_arn = aws_alb_target_group.my_tg.arn
    type = "redirect"
    redirect {
      protocol    = "HTTPS"
      port        = "443"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_alb_target_group" "my_tg" {
  name        = "my-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my_vpc.id
  target_type = "ip"
}
resource "aws_alb_listener" "https" {
  load_balancer_arn = aws_alb.my_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.my_cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.my_tg.arn
  }
}
