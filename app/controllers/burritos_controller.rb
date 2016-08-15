# display a list of all burritos for a specific restaurant
get '/restaurants/:restaurant_id/burritos' do

  @restaurant = Restaurant.find(params[:restaurant_id])
  @reviews = Review.where(restaurant_id: params[:restaurant_id])
  @burritos = Burrito.where(restaurant_id: params[:restaurant_id])

  if request.xhr?
    erb :'burritos/_index', layout: false
  else
    erb :'burritos/index'
  end
end

# returns a form for creating a new burrito belonging to a specific restaurant
get '/restaurants/:restaurant_id/burritos/new' do
  @reviews = Review.where(restaurant_id: params[:restaurant_id])
  @restaurant = Restaurant.find(params[:restaurant_id])

  if request.xhr?
    erb :'burritos/_new', layout: false
  else
    erb :'burritos/new'
  end
end

# create a new burrito belonging to a specific restaurant
post '/restaurants/:restaurant_id/burritos' do

  @restaurant = Restaurant.find(params[:restaurant_id])
  @reviews = Review.where(restaurant_id: params[:restaurant_id])
  @burrito = Burrito.new(params[:burrito])

  if request.xhr?
    if @burrito.save
      "burrito saved"
    else
      "Error, please try again."
    end
  else
    if @burrito.save
      redirect "/restaurants/#{@restaurant.id}/burritos/#{@burrito.id}"
    else
      @errors = @burrito.errors.full_messages
      erb :'burritos/new'
    end
  end

end

# display a specific burrito belonging to a specific restaurant
get '/restaurants/:restaurant_id/burritos/:id' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  @reviews = Review.where(burrito_id: params[:id])
  @burrito = Burrito.find(params[:id])

  erb :'burritos/show'

end

# get '/restaurants/:restaurant_id/burritos/:burrito_id/upload' do
#   @uploads = Upload.all
#   @burrito = burrito.find(params[:burrito_id])
#   @restaurant = restaurant.find(params[:restaurant_id])
#   erb :'/burritos/upload'
# end

# post '/restaurants/:restaurant_id/burritos/:burrito_id/upload' do
#   @uploaded_file = @burrito.uploads.create(filepath: params[:upload])
#   @burrito.save!

#   @uploaded_file.to_s

# end