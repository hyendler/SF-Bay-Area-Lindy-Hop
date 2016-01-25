delete '/subscriptions/:id' do
  subscription = Subscription.find(params[:id])
  @channel = Channel.find(subscription.channel_id)
  @success = "You have unsubscribed from the channel."
  subscription.destroy
  erb :"/channels/show"
end