require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @user = users(:confirmed_user)
    @group = groups(:one)
  end

  test "group should be valid" do
    assert @group.valid?
  end

  test "group name should be present" do
    @group.name = nil
    assert_not @group.valid?
  end

end
