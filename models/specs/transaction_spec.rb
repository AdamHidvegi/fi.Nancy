require("minitest/autorun")
require("minitest/rg")
require_relative("../transaction.rb")

class TestTransaction < MiniTest::Test

  def setup
    options = {"id" => 1, "today_date" => 20190101, "price" => 20, "user_id" => 1, "merchant_id" => 1, "category_id" => 1}
    @transaction = Transaction.new(options)
  end

  def test_today_date()
    assert_equal(20190101, @transaction.today_date)
  end

  def test_price()
    assert_equal(20, @transaction.price)
  end

  def test_total_spending()
    assert_equal(60, Transaction.total_spending())
  end

end
