# Módulo S3

[IAC](../../README.md) / [Storage](../README.md) / **[AWS](./README.md)**

Módulo de infraestrutura como código (IAC) para provisionamento de S3 buckets na AWS.

## Provider

- [**AWS**](../../aws/README.md)

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html)

- [AWS CLI](https://aws.amazon.com/pt/cli/)

## Utilização

## Inputs

| Name | Description       | Type     | Default | Required |
| ---- | ----------------- | -------- | ------- | :------: |
| name | Nome do bucket S3 | `string` | n/a     |   yes    |

## Outputs

| Name                    | Description                         | Type     |
| ----------------------- | ----------------------------------- | -------- |
| resource_bucket_storage | Dados do recurso do Bucket Storage. | `object` |
