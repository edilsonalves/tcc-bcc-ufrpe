<h1 align="center">TCC BCC UFRPE</h1>
<p align="center">Uma Análise do Impacto das Linguagens de Programação nos Custos de Execução no AWS Lambda em Cenários de Cold Start e Warm Start</p>

## Pré-requisitos

- AWS CLI >= v2.11.0
- SAM CLI >= v1.76.0
- Docker >= v20.10.22

## Comandos

### Construir artefatos

```bash
$ make build
```

### Limpar artefatos

```bash
$ make clean
```

### Implantar infraestrutura e funções

```bash
$ make deploy
```

### Remover infraestrutura e funções

```bash
$ make destroy
```

### Inicializar API localmente

```bash
$ make start/local
```

## Observações

É necessário possuir as credenciais da AWS (`aws_access_key_id` e `aws_secret_access_key`) configuradas.

O trecho [[bucket-name]](https://github.com/edilsonalves/tcc-bcc-ufrpe/blob/main/samconfig.toml#L6) deve ser substituído por um nome válido de _bucket_ no Amazon S3.

Por padrão, a região AWS está configurada como [us-west-2](https://github.com/edilsonalves/tcc-bcc-ufrpe/blob/main/samconfig.toml#L8), essa configuração pode ser alterada.
