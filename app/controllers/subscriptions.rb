delete '/subscriptions/:id' do
  subscription = Subscription.find(params[:id])
  @channel = Channel.find(subscription.channel_id)
  # @success = "You have unsubscribed from the channel."
  subscription.destroy
  redirect "/channels/#{@channel.id}"
end

post '/subscriptions' do
  Subscription.create(user_id: session[:user_id], channel_id: params[:channel_id])
  redirect "/channels/#{params[:channel_id]}"
end
