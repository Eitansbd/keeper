require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | Fishing Log"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | Fishing Log"
  end

  test "should get about" do 
    get about_url
    assert_response :success
    assert_select "title", "About | Fishing Log"
  end
  
  test "should get contact" do 
    get contact_url
    assert_response :success
    assert_select "title", "Contact | Fishing Log"
  end
end
