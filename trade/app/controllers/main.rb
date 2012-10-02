require 'tilt/haml'
require '../app/models/Warmup/user'
class Main < Sinatra::Application
  get "/" do
    redirect '/login' unless session[:name]

    haml :list_users, :locals => {:current_name => session[:name],
                                  :users => Warmup::User.all,
                                  :items => Warmup::Item.all,
                                  :time => Time.now}
  end

  get "/buy/:name" do
    toBuy=Warmup::Item.by_name(params[:name])
    buyer=Warmup::User.by_name(session[:name])
    buyer.buy_item(toBuy.name,toBuy.owner)
    redirect '/'
  end

  get "/owners/:name" do
    owner=Warmup::User.by_name(params[:name])
    haml :owner, :locals => {:current_name => session[:name],
                                   :users => Warmup::User.all,
                                   :items => Warmup::Item.all,
                                   :owner => owner,
                                   :time => Time.now}
  end


end

