get '/' do
 redirect '/posts'
end

get '/posts' do
  @posts = Post.all
  erb :"posts/index"
end

get '/posts/new' do

  erb :"/posts/new"
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @user = User.find(@post.user_id)
  erb :"/posts/show"
end

post '/posts' do
  post = Post.new(title: params[:title], text: params[:text], user_id: session[:user_id])
  if post.save
    redirect "/posts/#{post.id}"
  else
    @errors = post.errors.full_messages
    erb :"/posts/new"
  end
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :"/posts/edit"
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  if @post.update_attributes(title: params[:title], text: params[:text])
    redirect "/posts/#{params[:id]}"
  else
    @errors = @post.errors.full_messages
    erb :"/posts/edit"
  end
end
