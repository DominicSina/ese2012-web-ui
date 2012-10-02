require 'rubygems'
require 'sinatra'
require 'haml'
require '../app/models/Warmup/item'
require '../app/models/Warmup/user'
require '../app/controllers/main'
require '../app/controllers/authentication'

class App < Sinatra::Base
  use Authentication
  use Main

  enable :sessions
  set :public_folder, 'app/public'
  configure :development do

    john=Warmup::User.named( 'John' )
    jim=Warmup::User.named( 'Jim' )
    julia=Warmup::User.named( 'Julia' )
    ese=Warmup::User.named( 'ese' )

    john.add_item('TV',150)
    john.add_item('Watch',50)
    jim.add_item('Lamp',20)
    jim.add_item('Sandwich',10)
    julia.add_item('Keyboard',75)
    ese.add_item('DVD',50)
    ese.add_item('PS3',135)
    ese.add_item('Chair',30)

    jim.activate_item('Sandwich')
    jim.activate_item('Lamp')
    john.activate_item('TV')
    julia.activate_item('Keyboard')
    ese.activate_item('DVD')


    end
  end
# Now, run it
App.run!
