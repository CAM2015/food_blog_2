require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  
  def setup
    #one way: use create! to ensures is hits the database
    @user = User.create!(username: 'camelia', email: 'camelia@gmail.com', 
                        password: "password", password_confirmation: "password")
    @post = Post.create(name: 'boild eggs', description: 'boil eggs for 8 min, add salt', user: @user)
    @post2 = Post.create(name: 'chicken nuggets', description: 'children favorite dish!', user: @user)
  end
  
  test "should get user show" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select "a[href=?]", post_path(@post), text: @post.name
    assert_select "a[href=?]", post_path(@post2), text: @post2.name
    assert_match @post.description, response.body
    assert_match @post2.description, response.body
    assert_match @user.username, response.body
  end
end

