require("minitest/autorun")
require("minitest/rg")
require_relative("../user.rb")

class TestUser < MiniTest::Test

  def setup
    options = {"id" => 1, "first_name" => "Adam", "last_name" => "Hidvegi", "wallet" => 1000, "email" => "hidvegiadam@gmail.com"}
    @user = User.new(options)
  end

  def test_first_name()
    assert_equal("Adam", @user.first_name)
  end

  def test_last_name()
    assert_equal("Hidvegi", @user.last_name)
  end

  def test_wallet()
    assert_equal(1000, @user.wallet)
  end

  def email()
    assert_equal("hidvegiadam@gmail.com", @user.email)
  end

  def test_whole_name()
    assert_equal("Adam Hidvegi", @user.whole_name())
  end

end
