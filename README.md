# Desafio Analista de Infra-estrutura VAGAS Tecnologia

Olá, obrigado por participar do nosso processo seletivo, entendemos que é difícil encontrar tempo principalmente quando está trabalhando, por isso agradecemos o seu tempo e dedicação.

O código produzido deve estar versionado em algum repositório público (Github, Bitbucket etc.).

Quando estiver tudo pronto, por favor, envie um e-mail para codesubmissions@vagas.com.br com o assunto "Infraestrutura Linux -  VAGAS.com - <%SEU_NOME%> " e o link para o seu repositório

## Stack necessário para a execução do desafio

* Jenkins
* Git
* Docker
* NGINX
* CHEF
* Terraform
* AWS AutoScaling

## Por onde começar

Este teste tem duas etapas.

Um que corresponde ao desenvolvimento de um cookbook utilizando CHEF para a instalação de uma aplicação que iremos te entregar, e outro teste de arquitetura que corresponde ao desenvolvimento de um deploy *Blue-Green* na AWS.

## Desafio: 01 Configuration Management

Nesta parte, queremos que você desenvolva um cookbook para a instalação e configuração de uma aplicação.

A aplicação já existe como um pacote debian com o nome "pacote-devops", ele está hospedado no Gemfury.

Para habilitar este repositorio, crie o arquivo /etc/apt/sources.list.d/fury.list com conteúdo da linha abaixo.

```bash
deb [trusted=yes] https://apt.fury.io/jailson-silva/ /
```

Este pacote contém uma aplicação ruby que será instalada no diretório "/opt/vagas/devops".

Os passos esperados para esta aplicação subir são:

* Instale e configure o NGINX para atender os serviços do unicorn.
* Instale o pacote da aplicação.
* Crie uma validação de ambiente, ou seja, queremos que a versão do pacote 2.0 seja instalada no ambiente de staging de a 1.0 no ambiente de produção.
* Se possível, e se sentir confortável pode desenvolver um [Custom Resource](https://docs.chef.io/custom_resources.html).
  
Exemplo de Custom Resource :

```ruby
  instalar_devopsapp 'vagas' do
    pacote 'pacote-devops'
    versao node['devopsapp']['versao']['pacote']
    action :instalar
  end
```

Abaixo segue exemplos de arquivos com configurações do CHEF para os ambientes:

Produção.

```json
{
  "name": "producao",
  "description": "Ambiente de Producao",
  "cookbook_versions": {},
  "json_class": "Chef::Environment",
  "chef_type": "environment",
  "default_attributes": {},
  "override_attributes": {}
}
```

Staging.

```json
{
  "name": "staging",
  "description": "Ambiente de Staging",
  "cookbook_versions": {},
  "json_class": "Chef::Environment",
  "chef_type": "environment",
  "default_attributes": {},
  "override_attributes": {}
}
```

Já o arquivo de configuração do unicorn por ser visto no arquivo app/unicorn.rb.

## Desafio: 02 Arquitetura

Para esta parte, queremos que seja desenvolvido um *Multi-Branch Pipeline* no Jenkins para um deploy estilo *Blue-Green* na AWS utilizando o AustoScaling.

Deve-se utilizar a mesma aplicação, porém desta vez sem o CHEF.

Esta aplicação deve rodar em Docker, existe um Dockerfile na pasta app/ que constroi o container.

Os passos esperados para esta aplicação subir são:

* Criar duas versões de imagens da aplicação, uma com a tag 1.0 e outra com a tag 2.0.
* Hospedar este container em um repositório público, ex. Dockerhub
* Realizar deploy estilo blue-green para cada versão da imagem utilizando o *Multi-Branch Pipeline* do Jenkins.
* Este deploy deve ser realizado dentro da estrutura de AustoScaling da AWS
* Importante: o Pipeline do Jenkins deve considerar a instalação das versões correspondentes pelos branches, sendo um branch de staging com a versao 2.0.x e um de produção com a versão 1.0.x, por exemplo.

## O que iremos avaliar em ambos os desafios

* Geração e estrutura da documentação README com os passos de execução do projeto.
* Uso de controle de versão.
* Uso de práticas de desenvolvimento (Unit/Integrations tests).
* Estilo de código.
* Execução dos códigos sem erros.

Caso queira utilizar o [Terraform](https://www.terraform.io) para fazer o deploy blue-green, fique a vontade! :+1:

Boa sorte :smile: