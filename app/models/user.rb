class User < ActiveRecord::Base
	has_many :microposts, dependent: :destroy
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
	                                                          uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }, allow_blank: true	                                                          
    has_secure_password	                                                          
end
