**Live demo:** https://xleed-blog.herokuapp.com/

## Postgres commands

Login as Postgres and run the following:

```sql
CREATE DATABASE blog_dev;
CREATE DATABASE blog_test;
CREATE ROLE blog_admin WITH LOGIN PASSWORD 'postgres';
ALTER USER blog_admin CREATEDB;
ALTER DATABASE blog_test OWNER TO blog_admin;
ALTER DATABASE blog_dev OWNER TO blog_admin;
```

Then run the migrations:

```bash
bin/rails db:migrate RAILS_ENV=test
bin/rails db:migrate RAILS_ENV=development
```

## Create initial data

Open a rails console and run:

```
User.new(username: 'JuanP', password: '1234').save
Category.new(name: 'Sports', description: 'News about sports').save
```

## Testing setup

This project uses RSpec, I followed [this guide](https://danielabaron.me/blog/start-rails-6-project-with-rspec/)

Other useful link: [here](https://matthewhoelter.com/2019/09/12/setting-up-and-testing-rails-6.0-with-rspec-factorybot-and-devise.html)

## Troubleshoot

* On Ubuntu 20.04: `An error occurred while installing pg (1.2.3)`. Solved by running: `sudo apt-get install libpq-dev ruby-dev`
