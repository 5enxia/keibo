require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  def setup
    @user = users(:confirmed_user)
    @payment = payments(:orange)
  end

  test "should be valid" do
    assert @payment.valid?
  end

  test "user id should be present" do
    @payment.user_id = nil
    assert_not @payment.valid?
  end

  test "price should be present" do
    @payment.price = nil
    assert_not @payment.valid?
  end

  test "price should be numerical" do
    @payment.price = "  " 
    assert_not @payment.valid?
  end

  test "content have not to be present" do
    @payment.content = "   "
    assert @payment.valid?
  end

  test "content should be at most 140 characters" do
    @payment.content = "a" * 141
    assert_not @payment.valid?
  end

  test "category id should be present" do
    @payment.category_id = nil
    assert_not @payment.valid?
  end

  test "category id should be numerical" do
    @payment.category_id = "  " 
    assert_not @payment.valid?
  end

end
