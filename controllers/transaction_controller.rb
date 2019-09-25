require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/category.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/user.rb' )
also_reload( '../models/*' )

# MAIN PAGE
get '/transactions' do
  erb(:'transaction/main')
end

# NEW
get '/transactions/new' do
  @users = User.all()
  @merchants = Merchant.all()
  @categories = Category.all()
  erb(:'transaction/new')
end

# INDEX
get '/transactions/index' do
  @transactions = Transaction.all()
  @money = Transaction.total_spending()
  @user = User.all().first()
  @alert = Transaction.alert(@user)
  @categories = Category.all()
  erb(:'transaction/index')
end

# CREATE
post '/transactions/index' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:'transaction/create')
end

# EDIT
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  @users = User.all()
  @merchants = Merchant.all()
  @merchant = @transaction.merchant()
  @categories = Category.all()
  @category = @transaction.category()
  erb(:'transaction/edit')
end

# UPDATE
post '/transactions/:id/update' do
  @transaction = Transaction.new(params)
  @transaction.update()
  erb(:'transaction/update')
end

# DELETE
post '/transactions/:id/delete' do
  @transaction = Transaction.find(params[:id])
  @transaction.delete()
  erb(:'transaction/delete')
end

get '/transactions/index/filterbydateincrease' do
  @transactions = Transaction.all()
  @money = Transaction.total_spending()
  @user = User.all().first()
  @alert = Transaction.alert(@user)
  erb(:'transaction/filterbydateincrease')
end

get '/transactions/index/filterbydatedecrease' do
  @transactions = Transaction.all()
  @money = Transaction.total_spending()
  @user = User.all().first()
  @alert = Transaction.alert(@user)
  erb(:'transaction/filterbydatedecrease')
end

get '/transactions/index/filterbypriceincrease' do
  @transactions = Transaction.all()
  @money = Transaction.total_spending()
  @user = User.all().first()
  @alert = Transaction.alert(@user)
  erb(:'transaction/filterbypriceincrease')
end

get '/transactions/index/filterbypricedecrease' do
  @transactions = Transaction.all()
  @money = Transaction.total_spending()
  @user = User.all().first()
  @alert = Transaction.alert(@user)
  erb(:'transaction/filterbypricedecrease')
end

get '/transactions/index/filterbymerchantincrease' do
  @transactions = Transaction.all()
  @money = Transaction.total_spending()
  @user = User.all().first()
  @alert = Transaction.alert(@user)
  erb(:'transaction/filterbymerchantincrease')
end

get '/transactions/index/filterbymerchantdecrease' do
  @transactions = Transaction.all()
  @money = Transaction.total_spending()
  @user = User.all().first()
  @alert = Transaction.alert(@user)
  erb(:'transaction/filterbymerchantdecrease')
end

get '/transactions/index/filterbycategoryincrease' do
  @transactions = Transaction.all()
  @money = Transaction.total_spending()
  @user = User.all().first()
  @alert = Transaction.alert(@user)
  erb(:'transaction/filterbycategoryincrease')
end

get '/transactions/index/filterbycategorydecrease' do
  @transactions = Transaction.all()
  @money = Transaction.total_spending()
  @user = User.all().first()
  @alert = Transaction.alert(@user)
  erb(:'transaction/filterbycategorydecrease')
end
