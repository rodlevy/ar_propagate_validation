get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :create_event
end

post '/events/create' do
  p params[:event]
  @new_event = Event.create(params[:event])
  if @new_event.invalid?
    p @new_event.errors.messages
    erb :create_event
  end
  erb :create_event


end
