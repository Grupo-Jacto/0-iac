# Módulos IAC para recursos na GCP

[IAC](../README.md) / **[GCP](./README.md)**

Módulos de infraestrutura como código (IAC) para provisionamento de recursos na GCP.

## Módulos

### [**Cloud Storage**](../storage/gcp/README.md)

Módulo para criar e configurar Cloud Storage buckets na GCP.

- **Requisitos**: [Lista de Requisitos](../storage/gcp/README.md#requisitos)
- **Parâmetros**: [Lista de Parâmetros](../storage/gcp/README.md#variáveis)
- **Saídas**: [Lista de Saídas](../storage/gcp/README.md#outputs)
- **Uso**:

```hcl
  module "storage_gcp" {
    source = "github.com/paulosfjunior/iac/storage/gcp?ref=v1.0.0"
    // ... parâmetros
  }
```

## Versões
