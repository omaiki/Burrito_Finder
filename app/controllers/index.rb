# get '/' do
#   erb :location
# end

get '/' do
  @reviews = Review.order(updated_at: :desc).limit(7)
  erb :index
end

# post '/go' do
#   @lat = params[:lat]
#   @lon = params[:lon]
#   redirect '/users/login'
# end