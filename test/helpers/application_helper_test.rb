class ApplicationHelperTest < ActionView::TestCase
    test "full title helper" do
      assert_equal full_title,         "keibo" 
      assert_equal full_title("Help"), "Help | keibo"
    end
end