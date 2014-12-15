# Get the New Post form
get "/new" do
 
  @title = "New Post"
  @post = Post.new
  erb :"new"
end
 
post "/posts" do
 
 @filename = params[:uploaded_data][:filename]
 @type = params[:uploaded_data][:type]
 @name= params[:uploaded_data][:name]
 @tempfile = params[:uploaded_data][:tempfile]
 @head = params[:uploaded_data][:head]
 
 uploads ={}
 uploads[:fish] = Cloudinary::Uploader.upload(@tempfile.path,:tags => "basic_sample")
 
 @url = uploads[:fish]['url']
end