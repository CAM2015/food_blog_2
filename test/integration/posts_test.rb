require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  
  def setup
    #one way: use create! to ensures is hits the database
    @user = User.create!(username: 'camelia', email: 'camelia@gmail.com')
    @post = Post.create(name: 'boild eggs', description: 'boil eggs for 8 min, add salt', user: @user)
    
    #another way: use .build (does not hit the rdatabase ... so add .save)
    @post2 = @user.posts.build(name: 'chicken nuggets', description: 'children favorite dish!')
    @post2.save
  end
  
  test "should get posts index" do
    get posts_path
    assert_response :success
  end
  
  test "should get posts listing" do
    get posts_path
    assert_template 'posts/index'
    assert_match @post.name, response.body
    assert_match @post2.name, response.body
  end
 
end
