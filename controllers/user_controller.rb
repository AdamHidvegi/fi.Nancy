require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("../models/user.rb")
also_reload( '../models/*' )

# READ
get '/user' do
  @users = User.all()
  erb (:'user/index')
end

# EDIT
get '/user/:id/edit' do
  @user = User.find(params[:id])
  erb(:'user/edit')
end

# UPDATE
post '/user/:id/update' do
  @user = User.new(params)
  @user.update()
  erb(:'user/update')
end

# CREATE
# get '/user/new' do
#   erb(:'user/new')
# end
#
# post '/user' do
#   user= User.new(params)
#   user.save()
#   redirect to '/user'
# end

# DELETE
# post '/user/:id/delete' do
#   @user = User.find(params[:id])
#   @user.delete()
#   erb(:delete)
# end
