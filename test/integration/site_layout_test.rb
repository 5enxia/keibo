require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "layout links with non login user" do
    get root_path
    assert_select "a[href=?]", root_path, count: 1
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end

  test "layout links with login user" do
    sign_in users(:confirmed_user)
    get root_path
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", payments_path
    assert_select "a[href=?]", users_show_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
