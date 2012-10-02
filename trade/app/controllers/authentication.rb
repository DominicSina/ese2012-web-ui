require 'tilt/haml'
require '../app/models/Warmup/item'
require '../app/models/Warmup/user'
class Authentication < Sinatra::Application
  get "/login" do
    haml :login
  end
  post "/login" do
    name = params[:username]
    password = params[:password]

    fail "Empty username or password" if name.nil? or password.nil?
    fail "Username or password are not valid" if password != name or Warmup::User.by_name(name)==nil
    session[:name] = name
    redirect '/'
  end
  get "/logout" do
    session[:name] = nil
    redirect '/login'
  end
end