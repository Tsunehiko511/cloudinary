require 'sinatra'
require 'bundler/setup'
require 'thin'
require 'cloudinary'
require 'cloudinary/uploader'
require 'cloudinary/utils'
require 'active_record'
require 'sinatra/json'
require './models/comment.rb'

if Cloudinary.config.api_key.blank?
	require './config'
end
=begin
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'sqlite3://localhost/development.db')

class Comment < ActiveRecord::Base
end
=end
get "/" do
	@title = "New Post"
	@comments = Comment.all
	erb :index
end

post "/posts" do
	Comment.create({:body => params[:body]})
	@filename = params[:uploaded_data][:filename]
	@type = params[:uploaded_data][:type]
	@name= params[:uploaded_data][:name]
	@tempfile = params[:uploaded_data][:tempfile]
	uploads ={}
	uploads[:fish] = Cloudinary::Uploader.upload(@tempfile.path, :public_id=> @filename ,:tags => "basic_sample")
	@url = uploads[:fish]['url']
	redirect '/'
end