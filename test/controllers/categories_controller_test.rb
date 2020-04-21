require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:admin)
    sign_in(@user)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get edit" do
    get categories_url(categories(:food))
    assert_response :success
  end

end
