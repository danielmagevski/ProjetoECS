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
- Scan de segurança da imagem docker com o Trivy
- Assinatura da Imagem com o Cosing



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
+ [Docker](https://docker.com/)
    + [DockerHub](https://hub.docker.com/)
+ [Trivy](https://trivy.dev/)
+ [Cosign](https://docs.sigstore.dev/signing/quickstart/)

## Instruções para executar

A pipeline para criação do projeto com a imagem docker, um cluster ECS e uma task provisionado com terraform.

## Configurações 

**Variáveis armazendas em secrets:**

AWS_ACCESS_KEY_ID => Access Key utilizada para configurar o AWS CLI.

AWS_SECRET_ACCESS_KEY => Secret access Key utilizada para configurar o AWS CLI.

AWS_BUCKET_NAME => Nome do Bucket utilizado para armazenar o estado do projeto Terraform.

TF_BUCKET_NAME => Nome do arquivo utilizado para armazenar o estado do projeto Terraform.

DOCKERHUB_USERNAME => Nome do usuário no Docker Hub.

DOCKERHUB_TOKEN => Token utilizado no Docker Hub.

COSIGN_PRIVATE_KEY => Chave privada do Cosign para assinatura.

COSIGN_PASSWORD => Password da chave privada

## Estrutura da solução

![Estrutura da solução ](./diagrama/estrutura.drawio.png)

## Fluxo da solução

![Fluxo da solução](./diagrama/fluxo.drawio.png)

## Possíveis evoluções do projeto

+ Separar ambientes dev, homolog e prod utilizando o Terraform Workspace ou Terraform Grunt para criação e gerenciamento desses ambientes.

