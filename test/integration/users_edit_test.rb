require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    #one way: use create! to ensures is hits the database
    @user = User.create!(username: 'camelia', email: 'camelia@gmail.com', 
                          password: "password", password_confirmation: "password")
  end
  
   test "reject invalid edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { username: " ", email: "camelia@gmail.com"} }
    assert_template 'users/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "accept valid edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { username: "camelia1", email: "camelia1@gmail.com"} }
    assert_redirected_to @user  #@user is short for user page
    assert_not flash.empty?
    @user.reload
    assert_match "camelia1", @user.username
    assert_match "camelia1@gmail.com", @user.email
  end
end
