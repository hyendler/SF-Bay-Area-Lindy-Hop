get '/index' do
  @user = User.find(session[:user_id])
  erb :index
end

get '/login' do
  if session[:user_id]
    redirect "/users/#{session[:user_id]}"
  else
    erb :login
  end
end

post '/login' do
  if user = User.authenticate(params[:email], params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @error = "Invalid email or password. Please try again."
    erb :login
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end

get '/users/new' do
  erb :"/users/new"
end

post '/users/new' do
  user = User.new(params)
  if user.save
    @success = "User successfully created"
    redirect 'login'
  else
    @errors = user.errors.full_messages
    erb :"/users/new"
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :"/users/show"
end