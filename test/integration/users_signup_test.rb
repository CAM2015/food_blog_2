require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "should get signup path" do
    get signup_path
    assert_response :success
  end
  
  
  test "accept valid signup" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, params: { user: { username: "camelia", email: "camelia@gmail.com", password: "password", password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end
  
end
