require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/merchant.rb' )
also_reload( '../models/*' )

# READ
get '/settings/merchant/index' do
  @merchants = Merchant.all()
  @all_merchants = Merchant.count_merchants()
  erb(:'merchant/index')
end

# NEW
get '/settings/merchant/new' do
  erb(:'merchant/new')
end

# CREATE
post '/settings/merchant/index' do
  @merchant = Merchant.new(params)
  @merchant.save()
  erb(:'merchant/create')
end

# EDIT
get '/settings/merchant/:id/edit' do
  @merchant = Merchant.find(params[:id])
  @merchants = Merchant.all()
  erb(:'merchant/edit')
end

# UPDATE
post '/settings/merchant/:id/update' do
  @merchant = Merchant.new(params)
  @merchant.update()
  erb(:'merchant/update')
end

# DELETE
post '/settings/merchant/:id/delete' do
  @merchant = Merchant.find(params[:id])
  @merchant.delete()
  erb(:'merchant/delete')
end
