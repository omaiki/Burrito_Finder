
get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login(@user)
    redirect "/users/#{current_user.id}"
  else
    @error = @user.errors.full_messages
    redirect '/users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @reviews = Review.where(user_id: params[:id])
  erb :"/users/show"
end