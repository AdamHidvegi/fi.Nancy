require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/user_controller.rb')
require_relative('controllers/category_controller.rb')
require_relative('controllers/merchant_controller.rb')
require_relative('controllers/transaction_controller.rb')
require_relative('controllers/settings_controller.rb')
also_reload( './models/*' )

get '/' do
  erb( :index )
end
