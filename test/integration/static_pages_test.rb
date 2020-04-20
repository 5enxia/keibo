require 'test_helper'

class StaticPagesTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:confirmed_user)
  end

end
