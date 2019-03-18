require 'test_helper'

class PostsDeleteTest < ActionDispatch::IntegrationTest
  

  def setup
    #one way: use create! to ensures is hits the database
    @user = User.create!(username: 'camelia', email: 'camelia@gmail.com', password: "password", password_confirmation: "password")
    @post = Post.create(name: 'boild eggs', description: 'boil eggs for 8 min, add salt', user: @user)
  end
  
  test "succesfully delete a post" do
    sign_in_as(@user, "password")
    get post_path(@post)
    assert_template 'posts/show'
    assert_select 'a[href=?]', post_path(@post), text: "Delete Post"
    assert_difference 'Post.count', -1 do #-1 because deleting means lees 1 post
      delete post_path(@post)
    end
    assert_redirected_to posts_path
    assert_not flash.empty?
  end
  
end
