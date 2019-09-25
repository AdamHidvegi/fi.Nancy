require("minitest/autorun")
require_relative("../merchant.rb")

class TestMerchant < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Amazon"}
    @merchant = Merchant.new(options)
  end

  def test_name()
    result = @merchant.name
    assert_equal("Amazon", result)
  end

  def test_count_merchants()
    assert_equal(11, Merchant.count_merchants())
  end

end
