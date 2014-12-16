source "https://rubygems.org"

gem 'sinatra'
gem 'activesupport', :require => 'active_support/all'
gem 'activerecord'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem "sinatra-contrib" 
gem 'json'
gem 'cloudinary'
gem 'thin'

group :development do
	gem 'sqlite3'
end

group :production do
	gem 'pg'
	gem "activerecord-postgresql-adapter"
end