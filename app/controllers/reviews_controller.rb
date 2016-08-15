# Show all reviews for specific restaurant
get '/restaurants/:restaurant_id/reviews' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  @reviews = @restaurant.reviews

  erb :'reviews/index'
end

# Show form for creating a new review
get '/restaurants/:restaurant_id/reviews/new' do
  @reviews = Review.where(restaurant_id: params[:restaurant_id])
  @burritos = Burrito.where(restaurant_id: params[:restaurant_id]).order(:name)
  @restaurant = Restaurant.find(params[:restaurant_id])

  # if request.xhr?
  #   erb :'reviews/_new', layout: false
  # else
    erb :'reviews/new'
  # end
end

# Submit form and create a new review
post '/restaurants/:restaurant_id/reviews' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  # @burritos = burrito.where(restaurant_id: params[:restaurant_id])
  @review = Review.new(params[:review])

  # if request.xhr?
    # if @review.save
    #   erb :'reviews/_show', layout: false
    # else
    #   "Error, please try again"
    # end
  # else
    if @review.save
      redirect "/restaurants/#{@restaurant.id}"
    else
      @errors = @review.errors.full_messages
      erb :'reviews/new'
    end
  # end
end

# display a specific review belonging to a specific restaurant
get '/restaurants/:restaurant_id/reviews/:id' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = @restaurant.reviews.find(params[:id])

  erb :'reviews/show'

end

# Show form to edit review
get '/restaurants/:id/reviews/:review_id/edit' do
  @burritos = Burrito.where(restaurant_id: params[:id]).order(:name)
  @restaurant = Restaurant.find(params[:id])
  @review = Review.find(params[:review_id])
  erb :'reviews/edit'
end

# Submit form to edit review
put '/restaurants/:restaurant_id/reviews/:id' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.find(params[:id])

  if @review.update_attributes(params[:review])
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors = @review.errors.full_messages
    erb :'reviews/edit'
  end
end

# Delete review
delete '/restaurant/:restaurant_id/reviews/:id' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.find(params[:id])

  @review.destroy

  redirect "/users/#{current_user.id}"
end