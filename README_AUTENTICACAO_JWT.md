# Dreampy Backend - Guia de Teste para Autenticação JWT

Este guia ajuda você a testar as funcionalidades básicas de autenticação do backend: registro, login e acesso a rota protegida.

---

## Pré-requisitos

- Projeto rodando com Docker (conforme README geral)  
- Postman instalado (ou qualquer cliente API REST)  
- Conhecimentos básicos de usar Postman ou similar  

---

## Passo 1: Registrar usuário novo

- Método: **POST**  
- URL: `http://localhost:8000/api/auth/register/`  
- Body (JSON):

```json
{
  "username": "teste1",
  "email": "teste1@example.com",
  "password": "senha123"
}
```

## Clique em Send

Deve retornar dados do usuário criado.

---

## Passo 2: Fazer login para obter token JWT

- Método: **POST**  
- URL: `http://localhost:8000/api/auth/login/`  
- Body (JSON):

```json
{
  "username": "teste1",
  "password": "senha123"
}
```

## Clique em Send

Vai receber JSON com os tokens **access** e **refresh**.

## Copie o valor do token access

---

## Passo 3: Acessar rota protegida `/api/auth/me/`

- Método: **GET**  
- URL: `http://localhost:8000/api/auth/me/`  
- Aba Headers: adicione

| Key           | Value                  |
| ------------- | ---------------------- |
| Authorization | Bearer <token_access_copiado> |

Clique em Send.

Vai receber os dados do usuário logado.

---

## Dicas

- Sempre copie o token exatamente como recebido, sem espaços extras.  
- O token access expira em um tempo (configurado no backend), aí é só fazer login de novo para pegar novo token.  
- Para sair, basta parar o container Docker com `docker-compose down`.  
- Se tiver dúvidas, fale com o time de desenvolvimento.