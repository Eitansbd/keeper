require 'test_helper'
require 'pry'
class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:david)
    @admin = users(:admin)
    @user_to_delete = users(:marry)
  end
  
  test "index pagination" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    User.paginate(page: 1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end
  
  test "no delete button for non-admin" do 
    log_in_as(@user)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
  
  test "delete for admin" do 
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    User.paginate(page: 1).each do |user|
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    
    assert_difference 'User.count', -1 do
      delete user_path(@user_to_delete)
    end
  end
end
