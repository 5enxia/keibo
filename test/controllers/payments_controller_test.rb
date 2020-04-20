require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @payment = payments(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Payment.count' do
      post payments_path, params: {
         micropost: {price: 100, content: "Lorem ipsum" } }
    end
    assert_redirected_to new_user_session_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Payment.count' do
      delete payment_path(@payment)
    end
    assert_redirected_to new_user_session_url
  end

end
