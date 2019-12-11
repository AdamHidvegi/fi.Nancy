require_relative("../models/category.rb")
require_relative("../models/merchant.rb")
require_relative("../models/transaction.rb")
require_relative("../models/user.rb")
require("pry-byebug")

User.delete_all()
Category.delete_all()
Merchant.delete_all()
Transaction.delete_all()

# CREATE USER
user1 = User.new({
  "first_name" => "Adam",
  "last_name" => "Hidvegi",
  "email" => "hidvegiadam@gmail.com",
  "wallet" => 1000
  })
user1.save()


# CREATE CATEGORY
category1 = Category.new({
  "name" => "Groceires"
  })
category1.save()


category2 = Category.new({
  "name" => "Beauty"
  })
category2.save()


category3 = Category.new({
  "name" => "Financial"
  })
category3.save()


category4 = Category.new({
  "name" => "Rent"
  })
category4.save()


category5 = Category.new({
  "name" => "Car"
  })
category5.save()


category6 = Category.new({
  "name" => "Entertainment"
  })
category6.save()


category7 = Category.new({
  "name" => "Clothing"
  })
category7.save()

category8 = Category.new({
  "name" => "General"
  })
category8.save()


category9 = Category.new({
  "name" => "Home"
  })
category9.save()


category10 = Category.new({
  "name" => "Learning"
  })
category10.save()


category11 = Category.new({
  "name" => "Medical"
  })
category11.save()


category12 = Category.new({
  "name" => "Nightlife"
  })
category12.save()


category13 = Category.new({
  "name" => "Restaurants"
  })
category13.save()


category14 = Category.new({
  "name" => "Services"
  })
category14.save()


category15 = Category.new({
  "name" => "Shop"
  })
category15.save()


category16 = Category.new({
  "name" => "Transport"
  })
category16.save()


category17 = Category.new({
  "name" => "Other"
  })
category17.save()


# CREATE MERCHANT
merchant1 = Merchant.new({
  "name" => "Amazon"
  })
merchant1.save()


merchant2 = Merchant.new({
  "name" => "Tesco"
  })
merchant2.save()

merchant3 = Merchant.new({
  "name" => "Morissons"
  })
merchant3.save()

merchant4 = Merchant.new({
  "name" => "Ebay"
  })
merchant4.save()

merchant5 = Merchant.new({
  "name" => "Waterstones"
  })
merchant5.save()


merchant6 = Merchant.new({
  "name" => "MnS"
  })
merchant6.save()


merchant7 = Merchant.new({
  "name" => "Ikea"
  })
merchant7.save()


merchant8 = Merchant.new({
  "name" => "Apple"
  })
merchant8.save()


merchant9 = Merchant.new({
  "name" => "Starbucks"
  })
merchant9.save()


merchant10 = Merchant.new({
  "name" => "Asda"
  })
merchant10.save()


merchant11 = Merchant.new({
  "name" => "Other"
  })
merchant11.save()


#CREATE TRANSACTION
transaction1 = Transaction.new({
  "today_date" => 20180901,
  "price" => 20,
  "user_id" => user1.id,
  "category_id" => category15.id,
  "merchant_id" => merchant1.id
  })
transaction1.save()


transaction2 = Transaction.new({
  "today_date" => 20180102,
  "price" => 10,
  "user_id" => user1.id,
  "category_id" => category2.id,
  "merchant_id" => merchant2.id
  })
transaction2.save()

transaction3 = Transaction.new({
  "today_date" => 20180203,
  "price" => 20,
  "user_id" => user1.id,
  "category_id" => category3.id,
  "merchant_id" => merchant3.id
  })
transaction3.save()


transaction4 = Transaction.new({
  "today_date" => 20180113,
  "price" => 10,
  "user_id" => user1.id,
  "category_id" => category4.id,
  "merchant_id" => merchant4.id
  })
transaction4.save()


# TESTING METHODS
users = User.all()
categories = Category.all()
merchants = Merchant.all()
transactions = Transaction.all()

binding.pry
nil
