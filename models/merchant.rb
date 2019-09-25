require_relative("../db/sql_runner.rb")

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  # INSTANCE METHODS

  # CREATE
  def save()
    sql = "INSERT INTO merchants
    (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]
    merchant = SqlRunner.run(sql, values).first()
    @id = merchant['id'].to_i()
  end

  # UPDATE
  def update()
    sql = "UPDATE merchants
    SET name
    =
    $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  # DELETE
  def delete()
    sql = "DELETE FROM merchants
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # CLASS METHODS

  # READ ALL
  def self.all()
    sql = "SELECT * FROM merchants"
    results = SqlRunner.run(sql)
    result = results.map { |result| Merchant.new(result)}
    return result
  end

  # DELETE ALL
  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  # FIND BY ID
  def self.find( id )
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [id]
    merchant = SqlRunner.run( sql, values )
    result = Merchant.new( merchant.first )
    return result
  end

  def self.count_merchants()
    all_merchants = Merchant.all()
    return all_merchants.count()
  end

end
