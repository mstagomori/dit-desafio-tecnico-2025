# Desafio Técnico para Cientista de Dados

Este documento fornece instruções sobre como configurar e executar o projeto usando Docker, além de executar os comandos `dbt seed` e `dbt run`.

## Pré-requisitos

- Docker instalado na sua máquina.
- Acesso ao repositório do projeto.

## Análise

A análise foi feita utilizando Python e Pandas. O relatório está em `analise/analise_pacientes.ipynb`.

## Instruções para rodar o Docker

1. **Clone o repositório do projeto:**

   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd meu_projeto_dbt
   ```

2. **Construa a imagem Docker:**

   2.1. No diretório raiz do projeto, execute o seguinte comando para construir a imagem Docker:

   ```bash
   docker-compose up --build -d
   ```

   2.2. Acesse o docker bash

   ```bash
   docker exec -it dbt_runner bash
   ```

   2.3. No bash do docker, execute dbt debug para verificar a conexão com o banco de dados. Se receber All checks passed!, a conexão está ok.

   ```bash
   dbt debug
   ```

   2.4. Execute o comando dbt seed para carregar os dados de seed no banco de dados. (Esta operação pode demorar alguns minutos, visto que são 100mil registros)

   ```bash
   dbt seed
   ```

   2.5. Execute o comando dbt run para executar as transformações de dados.

   ```bash
   dbt run
   ```

3. **Acesse o banco de dados:**

   3.1. Acesse o docker do banco de dados com o seguinte comando:

   ```bash
   docker-compose exec db psql -U dbt_user -d dbt_database
   ```

   3.2. Execute o comando \dt para listar as tabelas do banco de dados.

   ```bash
   \dt
   ```

   3.3. Selecione a tabela para visualizar, segundo o exemplo:

   ```bash
   SELECT * FROM public.ingestao
   ```

   3.4. Caso desejar, copie o arquivo para um csv:

   ```bash
   \copy public.ingestao TO 'arquivo.csv' WITH CSV HEADER;
   ```

   3.5. Para visualizar o arquivo csv, é preciso acessar o container do postgres:

   ```bash
   docker exec -it dbt_postgres bash
   ```
