require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    #one way: use create! to ensures is hits the database
    @user = User.create!(username: 'camelia', email: 'camelia@gmail.com', 
                          password: "password", password_confirmation: "password")
    @user2 = User.create!(username: "emma", email: "emma@gmail.com",
                          password: "password", password_confirmation: "password")     
    @admin_user = User.create!(username: "emma2", email: "emma2@gmail.com",
                          password: "password", password_confirmation: "password", admin: true)  
  end
  
   test "reject invalid user edit" do
    sign_in_as(@user, "password")
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { username: " ", email: "camelia@gmail.com"} }
    assert_template 'users/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "accept valid user edit" do
    sign_in_as(@user, "password")
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { username: "camelia1", email: "camelia1@gmail.com"} }
    assert_redirected_to @user  #@user is short for user page
    assert_not flash.empty?
    @user.reload
    assert_match "camelia1", @user.username
    assert_match "camelia1@gmail.com", @user.email
  end
  
  test "accept edit attempt by admin user" do
    sign_in_as(@admin_user, "password")
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { username: "camelia3", email: "camelia3@gmail.com"} }
    assert_redirected_to @user  #@user is short for user page
    assert_not flash.empty?
    @user.reload
    assert_match "camelia3", @user.username
    assert_match "camelia3@gmail.com", @user.email
  end
  
  
 
  
end
