require 'test_helper'

class StaticPagesTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:confirmed_user)
    @payments << payments(:orange)
  end

end
