[![Code Climate](https://codeclimate.com/github/tasafo/tasafo_jobs/badges/gpa.svg)](https://codeclimate.com/github/tasafo/tasafo_jobs)
[![Test Coverage](https://codeclimate.com/github/tasafo/tasafo_jobs/badges/coverage.svg)](https://codeclimate.com/github/tasafo/tasafo_jobs/coverage)
[![Build](https://github.com/tasafo/tasafo_jobs/actions/workflows/build.yml/badge.svg)](https://github.com/tasafo/tasafo_jobs/actions/workflows/build.yml)
[![security](https://hakiri.io/github/tasafo/tasafo_jobs/master.svg)](https://hakiri.io/github/tasafo/tasafo_jobs/master)

# Trampos

Olá!

Este é um projeto criado pela comunidade Tá Safo! para listar vagas de empregos e currículos na área de TI!

Para começar a contribuir:

#### Dê um fork no projeto

#### Clone seu repositório fork localmente

#### Você vai precisar dos bancos de dados [PostgreSQL](https://www.postgresql.org/) e [Redis](https://redis.io/)

##### Você pode usar o [docker compose](https://docs.docker.com/compose/) com o comando

`$ docker-compose up`

#### Instale o Foreman

`$ gem install foreman`

#### Instale o Mailcatcher para testar e-mails no ambiente local

`$ gem install mailcatcher`

Rode o Mailcatcher quando precisar testar e-mails

`$ mailcatcher`

Abra o Mailcatcher http://127.0.0.1:1080 no navegador

#### Prepare o banco de dados

`cp .env.example .env`

`$ rails db:create db:migrate db:test:prepare`

#### Rode os testes

`$ rails spec`

#### Rode o SEED em desenvolvimento

`$ rails db:seed`

#### Para rodar o servidor local

`$ foreman start`

#### Cadastre-se ou entre com os seguintes usuários criados pelo SEED em desenvolvimento

david@mail.com   / pass: 12345678

maria@mail.com   / pass: 12345678

john@mail.com    / pass: 12345678

mark@mail.com    / pass: 12345678

terry@mail.com   / pass: 12345678

amanda@mail.com  / pass: 12345678

#### Ambiente de produção
Deve ser gerado o token de segurança

    SECRET_KEY_BASE=$(rake secret)

Configure a gravação de logs

    RAILS_LOG_TO_STDOUT=enabled

Configure a compilação de assets

    RAILS_SERVE_STATIC_FILES=enabled
