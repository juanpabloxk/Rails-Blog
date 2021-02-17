bin/rails generate model User name:string password_digest:string
rails g controller sessions new create login welcome
gem install bcrypt

bin/rails generate model Comment commenter:string body:text article:references
bin/rails generate migration CreateFollowersTable

bin/rails db:migrate #VERSION=20080906120000
heroku run rake db:migrate
