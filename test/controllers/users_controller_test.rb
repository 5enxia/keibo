require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @user = users(:non_confirmed_user)
  end

  test "should success sign up" do
    get new_user_registration_url
    user = User.new(email: @user.email, password: @user.password)
    user.skip_confirmation!
    user.save
  end

  test "should redirect login when not logged in" do
    get user_show_url
    assert_redirected_to new_user_session_url
  end

end
