# Módulo Cloud Storage

[IAC](../../README.md) / [Storage](../README.md) / **[GCP](./README.md)**

Módulo de infraestrutura como código (IAC) para provisionamento de buckets Cloud Storage no GCP.

## Provider

- [**GCP**](../../gcp/README.md)

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html)

- [GCP SDK](https://cloud.google.com/sdk/docs/install)

## Utilização

```hcl
module "storage_gcp" {
  source = "github.com/paulosfjunior/iac/storage/gcp?ref=v1.0.0"
  // ... parâmetros
}
```
