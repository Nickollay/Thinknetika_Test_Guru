# README

## Stack:
* Ruby version
ruby 2.7.1p83 

* Rails version
Rails 6.0.3.2

## Сущности:
* тесты
* вопросы
* ответы
* результат тестирования
* пользователи

### Основной функционал:
* Создание тестов и управление ими
* Аутентификация
* Базовые разграничения прав доступа
* Выполнение тестов
* Публикация результатов в соцсети

#### Set up
yarn should be installed, to install it locally:
`npm install -l yarn`

also you can create database in docker container by running command: 
`docker run -p 5432:5432 -e POSTGRES_USER=test-guru -e POSTGRES_PASSWORD=Password_1 -e POSTGRES_DB=TestGuru_development postgres:13.4`