require "rubygems"
require "bundler"

Bundler.require

config_file('./auth/config.yml')

Cloudinary.config do |config|
	config.cloud_name = settings.cloud_name
	config.api_key = settings.api_key
	config.api_secret = settings.api_secret
end

require "./app.rb"
run Sinatra::Application