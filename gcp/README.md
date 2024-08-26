# Módulos IAC para recursos na GCP

[IAC](../README.md) / **[GCP](./README.md)**

Módulos de infraestrutura como código (IAC) para provisionamento de recursos na GCP.

## Módulos

### [**Cloud Storage**](../storage/gcp/README.md)

Módulo para provisionamento de Cloud Storage buckets na GCP.

- **Requisitos**: [Lista de Requisitos](../storage/gcp/README.md#requisitos)
- **Inputs**: [Lista de Inputs](../storage/gcp/README.md#inputs)
- **Outputs**: [Lista de Outputs](../storage/gcp/README.md#outputs)
- **Uso**:

```hcl
  module "storage_gcp" {
    source = "github.com/paulosfjunior/iac/storage/gcp?ref=v1.0.0"
    // ... parâmetros
  }
```

### [**VPC**](../vpc/gcp/README.md)

Módulo para provisionamento de VPC na GCP.

- **Requisitos**: [Lista de Requisitos](../vpc/gcp/README.md#requisitos)
- **Inputs**: [Lista de Inputs](../vpc/gcp/README.md#inputs)
- **Outputs**: [Lista de Outputs](../vpc/gcp/README.md#outputs)
- **Uso**:

```hcl
  module "vpc_gcp" {
    source = "github.com/paulosfjunior/iac/vpc/gcp?ref=v1.0.0"
    // ... parâmetros
  }
```

## Versões
