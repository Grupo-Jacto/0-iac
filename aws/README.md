# Módulos IAC para recursos na AWS

[IAC](../README.md) / **[AWS](./README.md)**

Módulos de infraestrutura como código (IAC) para provisionamento de recursos na AWS.

## Módulos

### [**S3**](../storage/aws/README.md)

Módulo para criar e configurar S3 buckets na AWS.

- **Requisitos**: [Lista de Requisitos](../storage/aws/README.md#requisitos)
- **Parâmetros**: [Lista de Parâmetros](../storage/aws/README.md#variáveis)
- **Saídas**: [Lista de Saídas](../storage/aws/README.md#outputs)
- **Uso**:

```hcl
  module "storage_aws" {
    source = "github.com/paulosfjunior/iac/storage/aws?ref=v1.0.0"
    // ... parâmetros
  }
```

## Versões
