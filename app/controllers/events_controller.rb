get '/events/:day' do
  @day = params[:day]
  # @events = Event.where("day = #{@day}")
  p "I'm in the route!"
  # p @events

  # if request.xhr?
  #   @events
  # else
  # end
end

get '/events/new' do

end

post '/events' do

end

get '/events/:id' do

end

get '/events/:id/edit' do

end
