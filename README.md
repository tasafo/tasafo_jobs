[![Code Climate](https://codeclimate.com/github/tasafo/tasafo_jobs/badges/gpa.svg)](https://codeclimate.com/github/tasafo/tasafo_jobs) [![Test Coverage](https://codeclimate.com/github/tasafo/tasafo_jobs/badges/coverage.svg)](https://codeclimate.com/github/tasafo/tasafo_jobs/coverage) [![Build Status](https://travis-ci.org/tasafo/tasafo_jobs.svg?branch=master)](https://travis-ci.org/tasafo/tasafo_jobs)

Olá!

Este é um projeto criado pela comunidade Tá Safo! para listar vagas de empregos e currículos na área de TI!

Para começar a contribuir:

#### Dê um fork no projeto

#### Clone seu repositório fork localmente

#### Instale o Mailcatcher para testar emails no ambiente local

`$ gem install mailcatcher`

Rode o Mailcatcher quando precisar testar emails

`$ mailcatcher`

Abra o Mailcatcher http://127.0.0.1:1080 no navegador

#### Prepare o banco de dados (MySQL)

`cp .env.example .env`

`vim .env`

`$ rake db:create`

`$ rake db:migrate`

`$ rake db:test:prepare`

#### Rode os testes

`$ rspec .`

#### Rode o SEED em desenvolvimento

`$ rake db:seed`

#### Para rodar o servidor local

`$ rails s`

#### Cadastre-se ou entre com os seguintes usuários criados pelo SEED em desenvolvimento

david@mail.com   / pass: 12345678

maria@mail.com   / pass: 12345678

john@mail.com    / pass: 12345678

mark@mail.com    / pass: 12345678

terry@mail.com   / pass: 12345678

amanda@mail.com  / pass: 12345678
