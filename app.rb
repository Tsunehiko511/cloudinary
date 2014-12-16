require 'sinatra'
require 'bundler/setup'
require 'thin'
require 'cloudinary'
require 'cloudinary/uploader'
require 'cloudinary/utils'
require 'active_record'
require 'sinatra/json'
require './models/comment.rb'
require 'securerandom'

if Cloudinary.config.api_key.blank?
	require './config'
end
get "/" do
	@title = "New Post"
	@comments = Comment.all
	erb :index
end

post "/posts" do
	if params[:uploaded_data]
		@filename = SecureRandom.uuid
		Comment.create({:body => params[:body],:name => params[:username],:filename => @filename})
		@tempfile = params[:uploaded_data][:tempfile]
		uploads ={}
		uploads[:fish] = Cloudinary::Uploader.upload(@tempfile.path, :public_id=> @filename, :format=>'jpg' ,:tags => "basic_sample")
		@url = uploads[:fish]['url']
	else
				Comment.create({:body => params[:body],:name => params[:username]})
	end
	redirect '/'
end

post "/delete" do
	ActiveRecord::Base.connection_pool.with_connection do
		begin
			Comment.find(params[:id]).destroy
			if params[:filename]
				Cloudinary::Uploader.destroy(public_id = params[:filename])
			end
			redirect '/'
		end
	end
end