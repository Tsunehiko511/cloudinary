require "rubygems"
require "bundler"
 
Bundler.require
 
config_file './auth/config.yml' #cloudinary利用の設定情報を入れる。
 
Cloudinary.config do |config|
  config.cloud_name = settings.cloud_name
  config.api_key = settings.api_key
  config.api_secret = settings.api_secret
end
 
require "./app"
run Sinatra::Application