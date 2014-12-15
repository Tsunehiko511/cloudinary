require 'sinatra'
require 'bundler/setup'
require 'thin'
require 'cloudinary'
require 'cloudinary/uploader'
require 'cloudinary/utils'

if Cloudinary.config.api_key.blank?
	require './config.ur'
end

get "/" do
	@title = "New Post"
	erb :index
end

post "/posts" do
	@filename = params[:uploaded_data][:filename]
	@type = params[:uploaded_data][:type]
	@name= params[:uploaded_data][:name]
	@tempfile = params[:uploaded_data][:tempfile]
	uploads ={}
	uploads[:fish] = Cloudinary::Uploader.upload(@tempfile.path,:tags => "basic_sample")
	@url = uploads[:fish]['url']
	erb :index
end