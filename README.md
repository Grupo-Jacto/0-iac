# Módulos IAC

Módulos de infraestrutura como código (IAC) para provisionamento de recursos na AWS e GCP.

## Providers

- [AWS](./aws/README.md)

- [GCP](./gcp/README.md)

## Módulos

- [Storage](./storage/README.md): Módulo para criar e configurar storage bucket.
  - [AWS](./storage/aws/README.md)
  - [GCP](./storage/gcp/README.md)

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html)

- [AWS CLI](https://aws.amazon.com/pt/cli/)

- [GCP SDK](https://cloud.google.com/sdk/docs/install)

## Parâmetros

Os parâmetros estão disponíveis nos `README.md` de cada módulo.

## Saídas

As saídas estão disponíveis nos `README.md` de cada módulo.

## Contribuições

Contribuições são bem-vindas! Para contribuir, siga as instruções abaixo:

1. Faça um fork do projeto.

2. Crie uma nova branch com o nome da sua feature:

```bash
git checkout -b feature/nome-da-feature
```

3. Faça as alterações necessárias e commit:

```bash
git add .
git commit -m "Descrição da feature"
```

4. Faça o push para a branch:

```bash
git push origin feature/nome-da-feature
```

5. Abra um pull request.

6. Após a revisão, o pull request será mesclado.

## Suporte

Em caso de dúvidas ou problemas, abra uma [ISSUE](https://github.com/paulosfjunior/iac/issues/new)

## Documentação

Para mais informações, consulte a documentação oficial do [Terraform](https://www.terraform.io/docs/index.html).

## Estrutura

```doc
.
├── README.md
├── aws
│   └── README.md
├── gcp
│   └── README.md
├── storage
│   ├── README.md
│   ├── aws
│   │   ├── README.md
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── gcp
│       ├── README.md
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── vpc
│   ├── README.md
│   ├── aws
│   │   ├── README.md
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── gcp
│       ├── README.md
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
|
└── ...outros módulos
```

## Licença

Este projeto está licenciado sob a licença BSD 3-Clause License - consulte o arquivo [LICENSE](./LICENSE) para obter detalhes.

## Colaboradores

Os seguintes usuários estão contribuindo para este projeto:

|                                                                                                       | Nome              | E-mail                            |
| :---------------------------------------------------------------------------------------------------: | :---------------- | :-------------------------------- |
| <img src="https://avatars.githubusercontent.com/u/27088472?v=4" width=50 style="border-radius: 50%">  | **Paulo Freitas** | <paulosfjunior@gmail.com>         |
| <img src="https://avatars.githubusercontent.com/u/137942353?v=4" width=50 style="border-radius: 50%"> | **Paulo Freitas** | <paulo.freitas@grupojacto.com.br> |
