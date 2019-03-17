require 'test_helper'

class UserTest < ActiveSupport::TestCase
    
    def setup
      @user = User.new(username: "Camelia", email: "camelia@gmail.com", password: "password", password_confirmation: "password")
    end
    
    test "should be valid" do
      assert @user.valid?
    end
    
    test "name should be present" do
      @user.username = " "
      assert_not @user.valid?
    end
    
    test "name should be less than 40 characters" do
      @user.username = "a" * 41
      assert_not @user.valid?
    end
    
    test "email should be present" do
      @user.email = " "
      assert_not @user.valid?
    end
    
    test "email should be less than 251 characters" do
      @user.email = "a" * 245 + '@gmail.com'
      assert_not @user.valid?
    end
    
    test "email should accept correct format" do
      valid_emails = %w[user@example.com CAMELIA@gmail.com C.name@yahoo.com]
      valid_emails.each do |valids|
        @user.email = valids
        assert @user.valid?, '#{valids.inspect} should be valid'
      end
    end
    
    test "should reject invalid addresses" do
      invalid_emails = %w[camelia@example camelia@example,com camelia.name@gmail. cam@some+some.com]
      invalid_emails.each do |invalids|
        @user.email = invalids
        assert_not @user.valid?, '#{invalids.inspect} should be invalid'
      end
    end
    
    test "email should be unique and case insensitive" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      assert_not duplicate_user.valid?
    end
    
    test "email should be lowercase before hitting db" do
      mixed_email = 'CamElIa@Example.com'
      @user.email = mixed_email
      @user.save
      assert_equal mixed_email.downcase, @user.reload.email
    end
    
    test "password should be present" do
      @user.password = @user.password_confirmation = " "
      assert_not @user.valid?
    end
    
    test "password should be at least 5 characters" do
      @user.password = @user.password_confirmation = "x" * 4
      assert_not @user.valid?
    end
    
    test "associated posts should be destroyed" do
      @user.save
      @user.posts.create!(name: "testing delete", description: "testing delete function")
      assert_difference 'Post.count', -1 do
        @user.destroy
      end
    end
    
end
