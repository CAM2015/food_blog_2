require "test_helper"

class PostTest <ActiveSupport::TestCase
    
    def setup
      #create a user
      @user = User.create!(username: "camelia", email: "camelia@gmail.com", password: "password", password_confirmation: "password")
      #using .build automatically assign a user id to the posts
      @post = @user.posts.build(name: 'eggs', description: 'how to cook eggs') 
    end
    
    test "post without user should not be valid" do
      @post.user_id = nil
      assert_not @post.valid?
    end
    
    test "post should be valid" do
      assert @post.valid?
    end
    
    test "name should be present" do
      @post.name = ""
      assert_not @post.valid?
    end
    
    test "description should be present" do
      @post.description = ""
      assert_not @post.valid?
    end
    
    test "description should not be less than 5 characters" do
      @post.description = "a" * 3
      assert_not @post.valid?
    end
    
    test "description should not be more than 2000 characters" do
      @post.description = "a" * 2001
      assert_not @post.valid?
    end
    
end
