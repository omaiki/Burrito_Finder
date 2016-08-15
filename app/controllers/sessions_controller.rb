get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password])
    session[:id] = @user.id
    redirect "users/profile"
  else
    @errors = ["Invalid information, please try again"]
    erb :'/users/new'
  end
end

delete '/sessions' do
  session[:id] = nil
  redirect '/'
end