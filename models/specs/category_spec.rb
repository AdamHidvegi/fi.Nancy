require("minitest/autorun")
require_relative("../category.rb")

class TestCategory < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Groceries"}
    @category = Category.new(options)
  end

  def test_name()
    result = @category.name
    assert_equal("Groceries", result)
  end

  def test_count_categories()
    assert_equal(17, Category.count_categories())
  end

end
