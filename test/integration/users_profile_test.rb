require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  
  def setup
    @user = users(:david)
  end
  
  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', "#{@user.name} | Fishing Log"
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.fishing_trips.count.to_s, response.body
    assert_select 'div.pagination'
    @user.fishing_trips.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
end
