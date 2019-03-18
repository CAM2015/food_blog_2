require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create!(username: "camelia", email: "camelia@gmail.com", password: "password")
  end
  
  
  test "invalid login is rejected" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: " ", password: " "} }
    assert_template 'sessions/new'
    assert_not flash.empty?
      #when user in NOT logged in there is a login path and no logout path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    get root_path
    assert flash.empty?
  end
  
  test "valid login credentials accepted and begin session" do 
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email, password: @user.password} }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
      #when user in logged in, there is no loggin path, there is logout path, is a path to see the chef show page and a path to edit their profile
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
  end
  
end
