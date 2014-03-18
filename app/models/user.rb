# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	attr_accessible :name, :email
	attr_accessible :password, :password_confirmation
	before_save {self.email = email.downcase}
	before_create :create_remember_token

	email_regex = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :name,  :presence => true,
					  :length 	=> { :maximum => 50}
	validates :email, :presence => true,
					  :format   => { :with => email_regex},
					  :uniqueness => { :case_sensitive => false}
	has_secure_password 
	validates :password, length: { minimum: 6 }


  	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def User.hash(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

  	private

	   def create_remember_token
	    self.remember_token = User.hash(User.new_remember_token)
	   end
end
