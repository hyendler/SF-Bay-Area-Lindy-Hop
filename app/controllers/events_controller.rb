get '/events/:day' do
  @day = params[:day].capitalize
  events = Event.where(day: @day)
  p events

  if request.xhr?
    events.to_json
  else
  end
end

get '/events/new' do

end

post '/events' do

end

get '/events/:id' do

end

get '/events/:id/edit' do

end
