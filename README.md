# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration
### PostgreSQL 설치
```
$ brew install postgresql
```

### PostgreSQL 유저 생성
```
$ psql postgres
postgres=# CREATE ROLE instagooram WITH LOGIN PASSWORD 'instagooramkcd' CREATEDB;
postgres=# \q
```

* Database creation
```
$ export INSTAGOORAM_DATABASE_PASSWORD=instagooramkcd
$ rake db:create
$ rake db:migrate
```

* Database initialization


* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
