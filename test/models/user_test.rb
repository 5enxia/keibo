require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      username: "Example User",
      email: "user@example.com",
      password: "foobar"
    )
  end

  test "associated payments should be destroyed" do
    @user.skip_confirmation!
    @user.save
    @user.payments.create!(price: 100, content: "Salad")
    assert_difference 'Payment.count', -1 do
      @user.destroy
    end
  end
end
