require_relative("../db/sql_runner.rb")

class Category

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

# INSTANCE METHODS

# CREATE
  def save()
    sql = "INSERT INTO categories
    (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]
    category = SqlRunner.run(sql, values).first()
    @id = category['id'].to_i()
  end

# UPDATE
  def update()
    sql = "UPDATE categories
    SET name
    =
    $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

# DELETE
  def delete()
    sql = "DELETE FROM categories
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

# CLASS METHODS

# READ ALL
  def self.all()
    sql = "SELECT * FROM categories"
    results = SqlRunner.run(sql)
    result = results.map { |result| Category.new(result)}
    return result
  end

# DELETE ALL
  def self.delete_all()
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

# FIND BY ID
def self.find( id )
  sql = "SELECT * FROM categories
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run( sql, values )
  result = Category.new( results.first )
  return result
end

def self.count_categories()
  all_categories = Category.all()
  return all_categories.count()
end

end
