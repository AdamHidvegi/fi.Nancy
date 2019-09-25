require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/category.rb' )
also_reload( '../models/*' )

# INDEX
get '/settings/category/index' do
  @categories = Category.all()
  @all_categories = Category.count_categories()
  erb(:'category/index')
end

# NEW
get '/settings/category/new' do
  erb(:'category/new')
end

# CREATE
post '/settings/category/index' do
  @category = Category.new(params)
  @category.save()
  erb(:'category/create')
end

# EDIT
get '/settings/category/:id/edit' do
  @category = Category.find(params[:id])
  # @categories = Category.all()
  erb(:'category/edit')
end

# UPDATE
post '/settings/category/:id/update' do
  @category = Category.new(params)
  @category.update()
  erb(:'category/update')
end

# DELETE
post '/settings/category/:id/delete' do
  @category = Category.find(params[:id])
  @category.delete()

  erb(:'category/delete')
end
