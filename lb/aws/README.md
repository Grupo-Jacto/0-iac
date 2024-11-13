# Módulo Load Balancer AWS

[IAC](../../README.md) / [Load_Balancer](../README.md) / **[AWS](./README.md)**

Módulo de infraestrutura como código (IAC) para provisionamento de Load Balancer na AWS.

## Provider

- [**AWS**](../../aws/README.md)

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html)

- [AWS CLI](https://aws.amazon.com/pt/cli/)

## Utilização

```hcl
module "lb_aws" {
  source = "github.com/Grupo-Jacto/iac/lb/aws?ref=v1.0.0"

  aws_account_id = "<ACCOUNT_ID>"
  project_name = "<PROJECT_NAME>"
  project_env = "<PROJECT_ENV>"
  vpc_id = "<VPC_ID>"
}
```

## Resources

| Name                                                                                                                                          | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_lb.lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb)                                                   | resource    |
| [aws_lb_listener.listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener)                           | resource    |
| [aws_lb_target_group.target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group)               | resource    |
| [aws_lb_target_group_attachment.test](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource    |
| [aws_security_group.lb_segurity_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)            | resource    |
| [aws_subnet.subnets_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet)                                | data source |
| [aws_subnets.filter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets)                                  | data source |

## Inputs

| Name                    | Description                                                                                                                               | Type     | Default                  | Required |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------------------ | :------: |
| aws_account_id          | ID da sua conta AWS                                                                                                                       | `number` | n/a                      |   yes    |
| lb_deletion_protection  | Habilita o proteção contra deleção do load balancer                                                                                       | `bool`   | `true`                   |    no    |
| lb_internal             | Define se o load balancer será acessado apenas internamente ou externamente                                                               | `bool`   | `false`                  |    no    |
| lb_name                 | Nome do load balancer                                                                                                                     | `string` | `"my-lb"`                |    no    |
| lb_type                 | Selecione o tipo de load balancer 'application', 'network' ou 'gateway'                                                                   | `string` | `"application"`          |    no    |
| listener_count          | Quantidade de regras dentro do load balancer                                                                                              | `number` | `1`                      |    no    |
| listener_default_action | Ação padrão da listener. Possiveis prametros: 'forward', 'redirect', 'fixed-response', 'authenticate-cognito' e 'authenticate-oidc'       | `string` | `"forward"`              |    no    |
| listener_port           | Porta a ser liberada para 'ouvir' chamados                                                                                                | `number` | `80`                     |    no    |
| listener_protocol       | Procolo que esta sendo usado no ouvinte do listener                                                                                       | `string` | `"HTTP"`                 |    no    |
| project_env             | Abreviação do ambiente. Valores suportados: `sbx` para sandbox, `dev` para desenvolvimento, `hml` para homologação e `prd` para produção. | `string` | n/a                      |   yes    |
| project_name            | Nome do seu projeto                                                                                                                       | `string` | n/a                      |   yes    |
| project_region          | Região do seu projeto                                                                                                                     | `string` | `"us-east-1"`            |    no    |
| sg_name                 | Nome do security group                                                                                                                    | `string` | `"my-lb-security-group"` |    no    |
| target_group_name       | Nome do target group usado no listener do load balancer                                                                                   | `string` | `"my-target-group"`      |    no    |
| target_group_port       | Porta a ser liberada para 'ouvir' chamados no target group                                                                                | `number` | `80`                     |    no    |
| target_id               | O target(instancia, container, load balancer) a ser atachado no target group                                                              | `string` | `""`                     |    no    |
| target_type             | Tipo de target a ser associado no target group                                                                                            | `string` | `"ip"`                   |    no    |
| vpc_id                  | ID da sua vpc caso esteja criada                                                                                                          | `string` | n/a                      |   yes    |

## Outputs

| Name                        | Description                                                                                       |
| --------------------------- | ------------------------------------------------------------------------------------------------- |
| lb                          | Dados do Load Balancer                                                                            |
| lb_delete_protection_status | Status de proteção contra deleção do(s) load balancer(s): ativado (true) ou não ativado (false)   |
| lb_ids                      | ID(s) do(s) load balancer(s)                                                                      |
| lb_is_internal              | Aponta se o(s) load balancer(s) é(são) acessível(eis) internamente (true) ou externamente (false) |
| lb_listener                 | Listeners do load balancer                                                                        |
| lb_listener_target_groups   | Target groups associados ao load balancer                                                         |
| lb_names                    | Nome(s) do(s) load balancer(s)                                                                    |
| lb_security_groups          | Nome(s) dos security groups usados no(s) load balancer(s)                                         |
| lb_subnets                  | Subnets sendo usadas pelo(s) load balancer(s)                                                     |
| lb_types                    | Tipo(s) do(s) load balancer(s) escolhido(s)                                                       |

<!-- END_TF_DOCS -->
