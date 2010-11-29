# == Schema Information
# Schema version: 20101128103929
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

attr_accessor :password, :password_confirmation

attr_accessible :name, :email, :password, :password_confirmation

validates :name, :presence => true, :length => {:maximum => 50}

#email_regex = /\a[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i



validates :email, :presence => true, 
	:format => {:with => email_regex } , 
	:uniqueness =>{ :case_sensitive => false }

validates :password, :presence => true,
	:length => {:within => 6..40}, 
	:confirmation => true

  before_save :encrypt_password

def self.authenticate(email, submitted_password)


user = find_by_email(email)
return nil if user.nil?
return user if user.has_password?(submitted_password)



#if user = find_by_email(email)

#if user.has_password?(submitted_password)

#user
#else
#	nil
#end

#else
#	nil
#end

end

def has_password?(submitted_password)

encrypted_password == encrypt(submitted_password)
#if encrypt(submitted_password) == self.encrypted_password
#	log_in

end

  private

    def encrypt_password

	self.salt = make_salt if  new_record?

      	self.encrypted_password = encrypt(password)

    end

    def encrypt(string)
         
	secure_hash("#{salt}--#{string}")
	   
    end

    def make_salt 

	secure_hash("#{Time.now.utc}--#{password}")

    end

    def secure_hash(string)

	Digest::SHA2.hexdigest(string)

    end

end
