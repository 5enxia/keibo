require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @user = users(:confirmed_user)
    @category = categories(:food)
  end

  test "cagory should be valid" do
    assert @category.valid?
  end

  test "cagory name should be presence" do
    @category.name = nil 
    assert_not @category.valid?
  end
end
