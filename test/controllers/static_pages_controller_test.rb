require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @app_name = 'keibo'
  end
  
  test "should get root" do
    get root_url
    assert_response :success
    assert_select 'title', text: @app_name
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select 'title', text: 'Help | ' + @app_name
  end

  test "should get about" do
    get about_url 
    assert_response :success
    assert_select 'title', text: 'About | ' + @app_name
  end

  test "should get contact" do
    get contact_url 
    assert_response :success
    assert_select 'title', text: 'Contact | ' + @app_name
  end

end
