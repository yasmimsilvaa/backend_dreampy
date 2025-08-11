# Usamos uma imagem oficial do Python
FROM python:3.12

# Define diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos de requirements para instalar as dependências
COPY requirements.txt .

# Instala as dependências
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copia o restante do código para o container
COPY . .

# Exponha a porta que o Django vai usar
EXPOSE 8000
