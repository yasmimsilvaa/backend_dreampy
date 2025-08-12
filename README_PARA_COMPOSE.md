# Dreampy Backend - Instruções para Teste com Docker

Este guia serve para ajudar você a rodar e testar o backend Django com banco PostgreSQL via Docker.

---

## Requisitos

- Docker e Docker Compose instalados na máquina  
- Terminal/PowerShell para executar comandos

---

## Passo a passo para rodar o projeto

1. **Clone o repositório** (se ainda não tiver):

```bash
git clone <url-do-repositorio>
cd dreampybackend
```

2. **Verifique se os arquivos `docker-compose.yml`, `Dockerfile` e `.env` estão na raiz do projeto**

- `.env` deve conter as variáveis:

```env
POSTGRES_DB=dreampy
POSTGRES_USER=postgres
POSTGRES_PASSWORD=123456
POSTGRES_HOST=db
POSTGRES_PORT=5432
```

3. **Suba os containers com Docker Compose:**

```bash
docker-compose up --build -d
```

> O parâmetro `-d` faz rodar em background (detached mode).

4. **Verifique se os containers estão rodando:**

```bash
docker ps
```

Deve aparecer algo parecido com:

```
dreampybackend-web-1       # container Django
dreampybackend-db-1        # container PostgreSQL
```

5. **Execute as migrations para criar as tabelas no banco:**

```bash
docker exec -it dreampybackend-web-1 python manage.py migrate
```

6. **Acesse a aplicação no navegador:**

- Aplicação Django: [http://localhost:8000](http://localhost:8000)  
- Admin Django: [http://localhost:8000/admin](http://localhost:8000/admin)  

---

## Parar os containers

Para parar e remover os containers:

```bash
docker-compose down
```

---

## Logs

Para acompanhar os logs em tempo real:

```bash
docker-compose logs -f
```

Ou logs específicos:

```bash
docker-compose logs -f web
docker-compose logs -f db
```

---

## Observações

- Caso tenha problemas de conexão com banco, verificar se o container `db` está rodando.  
- O host do banco no Django é `db`, que é o nome do serviço Docker.

---

Se precisar de ajuda, entre em contato.