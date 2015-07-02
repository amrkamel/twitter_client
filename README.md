Twitter Client
================

This application a simple twitter client with the following features.
- User profiles
- List tweets inside the feed
- Follow/Unfollow a user
- Private messages between friends
- Search for users
- View any user profile to see his tweets


Ruby on Rails
-------------

This application requires:

- Ruby 2.2.2
- Rails 4.2.1
- MySQL

Getting Started
---------------

1- First you need to create a MySQL user with the name 'robusta' and password 'robusta'
     (you can change the username or password from config/database.yml file)

2- For initializing the database run
     "rake db:create db:migrate db:seed"

3- Go to the application directory and run the webrick server with the command
     "rails s"
     The default port is 3000 and you can access the application through http://localhost:3000
