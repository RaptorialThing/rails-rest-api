# README

[how to install](#how-to-install)
[api usage](#api-usage)


### how to install

#### Linux/Ubuntu
You need ruby, postgresql, git
[ruby, rbenv, rails](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04)
[git](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-20-04)
[postgresql](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart)
clone api source code
```
git clone https://github.com/RaptorialThing/rails-json-rest-api.git
```
install gems
```
bundle install
```
create postgresql database
```
rails db:create
```
create database tables
```
rails db:migrate
```
seed, fill tables with mock, test records
```
rails db:seed
```
Viola! that is it. now you can start server and play with api app
[api usage](#api-usage)

```
rails s
```

### api usage

curl example

authentication
/login

request
```
curl -X POST -d '{"username": "nomads", "email": "nomads@nomads.com", "password": "nomads"}' \
-H 'Content-type: application/json' \
localhost:3000/auth/login
```

response
```
{
  "user": {
    "id": 1,
    "username": "nomads",
    "password_digest": "password_diggest",
    "age": 3,
    "created_at": "2023-10-14T13:26:40.750Z",
    "updated_at": "2023-10-14T13:26:40.750Z"
  },
  "token": "sfssdfs.sdfsdf.sdfsdfs"
}
```


register

```
curl -X POST -H 'Content-type: application/json' \
-d '{"email": "nomads@nomads.com", "password": "nomads", "username": "nomads"}' \
 localhost:3000/auth/register
```


all authors

```
curl -X GET -H 'Content-type: application/json' \
 -H 'Authorization: `bearer sdfsd`' \
 localhost:3000/api/v1/authors
```

create new author (make user an author)
```
curl -X POST -H 'Content-type: application/json' -H 'Authorization: `bearer sdfsdd`' \
-d '{"user_id": "1"}'  localhost:3000/authors
```

delete author; delete from user_roles table by user_id
```
curl -X DELETE -H 'Content-type: application/json' \
-H 'Authorization: `bearer sdfsd`' \  localhost:3000/authors/1
```
