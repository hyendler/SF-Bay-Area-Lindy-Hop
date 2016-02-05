get '/events/index' do

end

get '/events/new' do

end

post '/events' do
  @bid = Bid.new(amount: params[:amount], user_id: params[:user_id], item_id: params[:item_id])
   @item = Item.find(params[:item_id])

  if @bid.save
    redirect "items/#{@item.id}"
  end
end

get '/events/:id' do

end

get '/events/:id/edit' do

end
