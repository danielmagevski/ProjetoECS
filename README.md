# ProjetoECS

[![CI](https://github.com/danielmagevski/ProjetoECS/actions/workflows/apply.yml/badge.svg)](https://github.com/danielmagevski/ProjetoECS/actions/workflows/apply.yml)

# Projeto com ECS

## Objetivo do projeto

Criar uma solucação em ECS para rodar um container com uma aplicação web com os sequintes recursos

- Cluster ECS rodando em Fargate
- Build e Push de uma imagem docker para o docker registry
- Task para criar o serviço rodando o container que foi criado
- IAM roles para que a task seja executada com as permissoes necessarias
- VPC na AWS com 2 subnetes em 2 AZ diferentes para alta disponibilidade
- Application Loadbalancer para roteador o trafego externo para os endereços internos
- Um apontamento do Route 53 com o Application Loadbalancer para o host app.labdev.cloud para ter um nome de fácil acesso
- Certificado validado e assinado para prover criptografia e cumprir os requisitos de segurança
- Um dashboard básico do CloudWatch para monitorar memória e CPU
- Um budget mensal para monitorar o custo com alerta de e-mail caso consuma 80% do que foi definido



## Tecnologias utilizadas no projeto

+ [AWS](https://aws.amazon.com)
   + [S3](https://aws.amazon.com/s3)
   + [ECS](https://aws.amazon.com/ecs/)
   + [Fargate](https://aws.amazon.com/fargate/)
   + [ACM](https://aws.amazon.com/certificate-manager/)
   + [CloudWatch](https://aws.amazon.com/cloudwatch/)
   + [Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/)
+ [Terraform](https://www.terraform.io)
+ [GitHub](https://github.com)
    + [GitHub Actions](https://github.com/features/actions)

## Instruções para executar

A pipeline de criação ou atualização do projeto é executada sempre que o código Terraform ou da Aplicação do projeto for alterado na branch main.


## Configurações 

**Variáveis armazendas em secrets:**

AWS_ACCESS_KEY_ID => Access Key utilizada para configurar o AWS CLI.

AWS_SECRET_ACCESS_KEY => Secret access Key utilizada para configurar o AWS CLI.

AWS_BUCKET_NAME => Nome do Bucket utilizado para armazenar o estado do projeto Terraform.

TF_BUCKET_NAME => Nome do arquivo utilizado para armazenar o estado do projeto Terraform.

DOCKERHUB_USERNAME => Nome do usuário no Docker Hub.

DOCKERHUB_TOKEN => Token utilizado no Docker Hub.

## Estrutura da solução

![Estrutura da solução ](./diagrama/estrutura.drawio.png)

## Fluxo da solução

![Fluxo da solução](./diagrama/fluxo.drawio.png)

