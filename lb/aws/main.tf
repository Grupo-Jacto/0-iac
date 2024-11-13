# Data source para buscar subnets na VPC especificada
data "aws_subnets" "filter" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_subnet" "subnets_id" {
  for_each = toset(data.aws_subnets.filter.ids)
  id       = each.value
}

resource "aws_security_group" "lb_segurity_group" {
  count = var.lb_type != null ? 1 : 0
  name  = var.sg_name
}

resource "aws_lb" "lb" {
  count = var.lb_type != null ? 1 : 0

  name                       = var.lb_name
  internal                   = var.lb_internal
  load_balancer_type         = var.lb_type
  security_groups            = [aws_security_group.lb_segurity_group[count.index].id]
  subnets                    = [for subnet in data.aws_subnet.subnets_id : subnet.id]
  enable_deletion_protection = var.lb_deletion_protection
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.lb[0].arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  dynamic "default_action" {
    for_each = var.listener_count >= 1 ? [1] : []

    content {
      type             = var.listener_default_action
      target_group_arn = aws_lb_target_group.target_group[0].arn
    }
  }
}

resource "aws_lb_target_group" "target_group" {
  count = var.lb_type == "application" && var.listener_protocol == "HTTPS" || var.listener_protocol == "HTTP" ? 1 : 0

  name        = var.target_group_name
  port        = var.target_group_port
  target_type = var.target_type
  protocol    = var.listener_protocol
  vpc_id      = var.vpc_id
}

resource "aws_lb_target_group_attachment" "test" {
  count = var.lb_type == "application" && var.listener_protocol == "HTTPS" || var.listener_protocol == "HTTP" ? 1 : 0

  target_group_arn = aws_lb_target_group.target_group[0].arn
  target_id        = var.target_id
  port             = var.target_group_port

  depends_on = [aws_lb_target_group.target_group]
}