require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('category_controller.rb')
require_relative('merchant_controller.rb')
also_reload( '../models/*' )

# READ
get '/settings' do
  erb (:'settings/index')
end
