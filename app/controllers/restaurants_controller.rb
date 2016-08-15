get '/restaurants' do
  @restaurants = Restaurant.order(:name)
  erb :'/restaurants/index'
end

get '/restaurants/new' do
  erb :'/restaurants/new'
end

post '/restaurants' do
  @restaurant = Restaurant.new(params[:restaurant])

  if @restaurant.save
    redirect '/restaurants'
  else
    @errors = @restaurant.errors.full_messages
    redirect '/restaurants/new'
  end
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  @reviews = Review.where(restaurant_id: params[:id]).order(updated_at: :desc)
  @burritos = Burrito.where(restaurant_id: params[:id])
  erb :'/restaurants/show'
end

get '/restaurants/:id/edit' do
  @restaurant = Restaurant.find(params[:id])
  erb :'/restaurants/edit'
end

put '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  @restaurant.update_attributes(params[:restaurant])
  redirect "/restaurants/"
end

delete '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])

  @restaurant.destroy

  redirect '/restaurants'
end