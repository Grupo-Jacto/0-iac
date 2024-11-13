output "lb" {
  value = [for lb in aws_lb.lb : {
    name                        = lb.name
    is_internal                 = lb.internal
    load_balancer_type          = lb.load_balancer_type
    security_groups             = lb.security_groups
    subnets                     = lb.subnets
    deletion_protect_is_enabled = lb.enable_deletion_protection
  }]
  description = "Dados do Load Balancer"
}

output "lb_listener" {
  value = {
    load_balancer_arn = aws_lb_listener.listener.load_balancer_arn
    port              = aws_lb_listener.listener.port
    protocol          = aws_lb_listener.listener.protocol
  }
  description = "Listeners do load balancer"
}


output "lb_listener_target_groups" {
  value = length(aws_lb.lb) > 0 ? [
    for target in aws_lb_target_group.target_group : {
      name           = target.name
      port           = target.port
      target_type    = target.target_type
      protocol       = target.protocol
      vpc_associated = target.vpc_id
    }
  ] : [] # Retorna uma lista vazia se não houver target groups

  description = "Target groups associados ao load balancer"
}

output "lb_ids" {
  value       = [for lb in aws_lb.lb : lb.id]
  description = "ID(s) do(s) load balancer(s)"
}

output "lb_names" {
  value       = [for lb in aws_lb.lb : lb.name]
  description = "Nome(s) do(s) load balancer(s)"
}

output "lb_is_internal" {
  value       = [for lb in aws_lb.lb : lb.internal]
  description = "Aponta se o(s) load balancer(s) é(são) acessível(eis) internamente (true) ou externamente (false)"
}

output "lb_types" {
  value       = [for lb in aws_lb.lb : lb.load_balancer_type]
  description = "Tipo(s) do(s) load balancer(s) escolhido(s)"
}

output "lb_security_groups" {
  value       = [for lb in aws_lb.lb : lb.security_groups]
  description = "Nome(s) dos security groups usados no(s) load balancer(s)"
}

output "lb_subnets" {
  value       = [for lb in aws_lb.lb : lb.subnets]
  description = "Subnets sendo usadas pelo(s) load balancer(s)"
}

output "lb_delete_protection_status" {
  value       = [for lb in aws_lb.lb : lb.enable_deletion_protection]
  description = "Status de proteção contra deleção do(s) load balancer(s): ativado (true) ou não ativado (false)"
}