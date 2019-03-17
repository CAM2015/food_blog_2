class User < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :username, presence: true, length: {maximum: 40}
  
    # https://rubular.com... to test a regular expresion with a string to see if it matches /
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum:250},
                      format: {with: VALID_EMAIL_REGEX },
                      uniqueness: {case_sensitive: false}
                      
    has_many :posts
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
end
