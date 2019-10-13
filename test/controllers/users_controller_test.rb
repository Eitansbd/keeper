require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:admin)
    @user = users(:david)
    @other_user = users(:jake)
    @user_to_delete = users(:marry)
  end
  
  test "should get new" do
    get signup_path
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect update when not logged in" do
    patch user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect edit when logged in as wrong user" do 
    log_in_as(@other_user)
    
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do 
    log_in_as(@other_user)
    
    patch user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect index when not logged in" do 
    get users_path
    assert_redirected_to login_url
  end
  
  test "should redirect delete when not logged in" do 
    assert_no_difference 'User.count' do 
      delete user_path(@user_to_delete)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect delete when not admin" do 
    log_in_as(@user)
    assert_no_difference 'User.count' do 
      delete user_path(@user_to_delete)
    end
    assert_redirected_to root_url
  end
  
  test "admin should delete user" do 
    log_in_as(@admin) 
    assert_difference 'User.count', -1 do 
      delete user_path(@user_to_delete)
    end
    
    assert_redirected_to users_url
  end
  
end
