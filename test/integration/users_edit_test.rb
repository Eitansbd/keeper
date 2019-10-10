require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:david)
  end
  
  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_user_path @user
    assert_template 'users/edit'
    
    patch user_path(@user), params: { user: { name: "", 
                                              email: "foo@invalid",
                                              password: "foo",
                                              password_confirmation: "foo bar" } }
    assert_template 'users/edit'
                                              
  end
  
  test 'successful edit' do
    log_in_as(@user)
    get edit_user_path @user
    assert_template 'users/edit'
    name = "Foo Bar"
    email = "Foo@bar.com"
    password = "Foo_Bar"
    patch user_path(@user), params: { user: { name: name, 
                                              email: email, 
                                              password: password,
                                              password_confirmation: password } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email.downcase, @user.email
    assert @user.authenticate(password)
  end
  
  test 'edit friendly forwarding' do 
    get edit_user_path(@user)
    log_in_as @user
    assert_redirected_to edit_user_path(@user)
  end
end
