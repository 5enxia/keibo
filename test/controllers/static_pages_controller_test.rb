require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @app_name = "keibo"
  end

  test "should get home" do
    get root_path 
    assert_response :success
    assert_select "title", "#{@app_name}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@app_name}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@app_name}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@app_name}"
  end

end
