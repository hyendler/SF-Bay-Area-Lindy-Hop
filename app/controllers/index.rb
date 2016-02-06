get '/' do
  erb :index
end

get '/events' do
  if request.xhr?
    Event.all.to_json
  else
  end
end

get '/days' do
  if request.xhr?
    erb :'_list_days', :layout => false
  else
  end
end
