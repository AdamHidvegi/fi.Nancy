require_relative("../db/sql_runner.rb")

class User

  attr_accessor :first_name, :last_name, :wallet, :email
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @wallet = options['wallet'].to_f()
    @email = options['email']
  end

# INSTANCE METHODS

# PUT NAME TOGETHER
  def whole_name()
    return "#{first_name} #{last_name}"
  end

# CREATE
  def save()
    sql = "INSERT INTO users
    (first_name, last_name, wallet, email)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id"
    values = [@first_name, @last_name, @wallet, @email]
    user = SqlRunner.run(sql, values).first()
    @id = user['id'].to_i()
  end

# UPDATE
  def update()
    sql = "UPDATE users
    SET (first_name, last_name, wallet, email)
    =
    ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@first_name, @last_name, @wallet, @email, @id]
    SqlRunner.run(sql, values)
  end

# DELETE
  def delete()
    sql = "DELETE FROM users
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

# CLASS METHODS

# FIND BY ID
  def self.find(id)
    sql = "SELECT * FROM users
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    user = User.new(result)
    return user
  end

# READ ALL
  def self.all()
    sql = "SELECT * FROM users"
    results = SqlRunner.run(sql)
    result = results.map { |result| User.new(result) }
    return result
  end

# DELETE ALL
  def self.delete_all()
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end


end
