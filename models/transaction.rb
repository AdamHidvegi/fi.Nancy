require_relative("../db/sql_runner.rb")
require_relative("./user.rb")

class Transaction

  attr_reader :id
  attr_accessor :today_date, :price, :user_id, :merchant_id, :category_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @today_date = options['today_date']
    @price = options['price'].to_f()
    @user_id = options['user_id'].to_i()
    @merchant_id = options['merchant_id'].to_i()
    @category_id = options['category_id'].to_i()
  end

# INSTANCE METHODS

# CREATE
  def save()
    sql = "INSERT INTO transactions
    (today_date, price, user_id, merchant_id, category_id)
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@today_date, @price, @user_id, @merchant_id, @category_id]
    transaction = SqlRunner.run(sql, values)
    @id = transaction.first()['id'].to_i()
  end

# UPDATE
  def update()
    sql = "UPDATE transactions
    SET (today_date, price, user_id, merchant_id, category_id)
    =
    ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@today_date, @price, @user_id, @merchant_id, @category_id, @id]
    SqlRunner.run(sql, values)
  end

# DELETE
  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

# CONNECTIONS
  def user()
    sql = "SELECT * FROM users
    WHERE id = $1"
    values = [@user_id]
    results = SqlRunner.run(sql, values)
    return User.new(results.first())
  end

  def category()
    sql = "SELECT * FROM categories
    WHERE id = $1"
    values = [@category_id]
    results = SqlRunner.run(sql, values)
    return Category.new(results.first())
  end

  def merchant()
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results.first())
  end


# CLASS METHODS

  def self.find( id )
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    result = Transaction.new( results.first )
    return result
  end

# READ ALL
  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    result = results.map { |result| Transaction.new(result)}
    return result
  end

# DELETE ALL
  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

# TOTAL SPENDING
  def self.total_spending()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    result = results.map { |result| result['price'].to_i()}
    return result.sum()
  end

# HOW MUCH MONEY YOU HAVE
  def self.alert(user)
    money = Transaction.total_spending()
    money_left = user.wallet.to_i() - money
    if money > user.wallet.to_i()
      return "You are out of money, stop spending it!"
    else
      return "You still have £#{money_left} in your wallet."
    end
  end



end
