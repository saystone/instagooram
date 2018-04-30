### Instagooram
I reinterpreted part of [Instagram API](https://web.archive.org/web/20180305181555/https://www.instagram.com/developer/endpoints) with GraphQL.

#### Built with
- Ruby 2.5
- Ruby on Rails 5.2 (API only)
- GraphQL
- JWT
- PostgreSQL
- Git
- AWS EB, RDS, EC2

#### Setting up development enviroment
1. Install the dependency packages
```
instagooram$ bundle install
```

2. Install PostgreSQL & create user
```
instagooram$ brew install postgresql
instagooram$ psql postgres
postgres=# CREATE ROLE instagooram WITH LOGIN PASSWORD '#{your_password}' CREATEDB;
postgres=# \q
```

3. Create Database & migration
```
instagooram$ rails db:create
instagooram$ rails db:migrate
instagooram$ rails db:seed
```

---

- Start server
```
instagooram$ rails server
```

#### Setting up deployment enviroment
1. Install AWS EB CLI & setting up enviroment
```
instagooram$ brew install awsebcli
instagooram$ eb init
... You need to input some your enviroment config with this interactive mode.
instagooram$ eb create
```
2. Set the main database to PostgreSQL. 
  - Go to ElasticBeanstalk on AWS Management Console. And select app.
  - Go to Configuration > Database And select database engine to postgres. And Check other options.
  - Click Save button on corner of right bottom. Then wait for restarting app.

---

- Deploying new code
```
instagooram$ git add .
instagooram$ git commit -m "Add stuff"
instagooram$ eb deploy
... wait for deploy
```

- Debugging
```
# Server status
instagooram$ eb status
# Open app with default browser
instagooram$ eb open
# Check logs
instagooram$ eb logs
# Connect SSH
instagooram$ eb ssh
```

### API
1. Support Coverage
  - Users, Relationships, Media, Likes

2. How can I find API spec?
  - You can find out `Insomnia_2018-04-20_instagooram.json` file on the project root.
  - Use this awesome REST/GraphQL API Client: [Insomnia REST API Client](https://insomnia.rest/download/) and Import it.

### More things to try
- Test code
- Improve Input type of GraphQL(https://medium.com/graphql-mastery/json-as-an-argument-for-graphql-mutations-and-queries-3cd06d252a04)
- Add Index of tables
- Refactor DRY
