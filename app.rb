require 'sinatra'

get "/" do
	@title = "New Post"
	erb :index
end

post "/posts" do
	@filename = params[:uploaded_data][:filename]
	@type = params[:uploaded_data][:type]
	@name= params[:uploaded_data][:name]
	@tempfile = params[:uploaded_data][:tempfile]
	@head = params[:uploaded_data][:head]
	uploads ={}
	uploads[:fish] = Cloudinary::Uploader.upload(@tempfile.path,:tags => params[:uploaded_data][:filename])
	@url = uploads[:fish]['url']
	redirect '/'
end