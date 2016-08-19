

get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    login(@user)
    redirect "/users/#{@user.id}"
  else
    flash[:error] = "Please re-enter your email and password."
    redirect '/sessions/new'
  end
end

delete '/sessions' do
  session[:id] = nil
  redirect '/'
end

get '/logout' do
  logout
  redirect '/'
end