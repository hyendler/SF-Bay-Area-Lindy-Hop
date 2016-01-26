get '/channels' do
  @channels = Channel.all
  erb :"/channels/index"
end

get '/channels/:id' do
  @channel = Channel.find(params[:id])
  @user = User.find(session[:user_id]) if session[:user_id]
  @subscription = Subscription.find_subscription(@user.id, @channel.id)
  erb :"/channels/show"
end
