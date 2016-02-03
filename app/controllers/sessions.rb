get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  if user = User.authenticate(params[:username], params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "Invalid username or password. Please try again."
    erb :"sessions/new"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
