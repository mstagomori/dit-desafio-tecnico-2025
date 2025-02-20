# Usa uma imagem oficial do Python como base
FROM python:3.10-slim

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Instala dependências do sistema necessárias para o dbt
RUN apt-get update && apt-get install -y \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Copia o arquivo de dependências do dbt
COPY requirements.txt requirements.txt

# Instala o dbt e dependências
RUN pip install --upgrade pip && pip install -r requirements.txt

# Instala o git
RUN apt-get update && apt-get install -y git


# Copia o projeto dbt para dentro do contêiner
COPY . .

# Define a variável de ambiente para localizar o profile do dbt
ENV DBT_PROFILES_DIR=/app

# Comando padrão ao iniciar o contêiner
CMD ["tail", "-f", "/dev/null"]
