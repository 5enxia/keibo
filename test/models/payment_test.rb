require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  def setup
    @user = users(:confirmed_user)
    @payment = @user.payments.build(price: 150, content:"hoge")
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

  test "content should be present" do
    @payment.content = "   "
    assert_not @payment.valid?
  end

  test "content should be at most 140 characters" do
    @payment.content = "a" * 141
    assert_not @payment.valid?
  end

  test "order should be most recent first" do
    assert_equal payments(:most_recent), Payment.first
  end
end
