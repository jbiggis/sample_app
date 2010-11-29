require 'spec_helper'

describe User do
  
	
	#	it "should not have a blank input" do
	#		User.name
	#		response.should_not be_blank
	#	end
	#	
	before (:each) do
	@attr = {:name =>"Example User", :email => "user@example.com", :password => "password", :password_confirmation => "password"}
	end

	it "should create a new instance given valid attributes" do
		User.create!(@attr)
	end
	
	it "should require a name" 	do	
	no_name_user = User.new(@attr.merge(:name=>""))
	no_name_user.should_not be_valid
	end

	it "should be no longer than 30 characters" 	do
	long_name = 'a' * 51
	long_name_user = User.new(@attr.merge(:name=>long_name))
	long_name_user.should_not be_valid
	end

describe "email validations" do

		it "should require an email" 	do	
	no_email_user = User.new(@attr.merge(:email=>""))
	no_email_user.should_not be_valid
	end
  
		it "should accept valid email addresses" do
addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
addresses.each do |email|
	valid_email_user = User.new(@attr.merge(:email => email))
			       valid_email_user.should be_valid
end
		end

		it "should not accept invalid email address" do
addresses = %w[asdfs@asdf.da,sf.com user@foo,com user_at_food.org example.user@foo.]
addresses.each do |email|
invalid_email_user = User.new(@attr.merge(:email => email))
invalid_email_user.should_not be_valid

end
		end

it "should reject duplicate email addresses" do

User.create!(@attr)
duplicate_email_user = User.new(@attr)
duplicate_email_user.should_not be_valid


end

it "should reject duplicate upcase email addresses" do

User.create!(@attr)
duplicate_upcase_email_user = User.new(@attr.merge(:email => @attr[:email].upcase))
duplicate_upcase_email_user.should_not be_valid
end

it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

end


describe "password validations" do

it "should have a password" do

	no_password_user = User.new(@attr.merge(:password=>"", :password_confirmation=>""))
no_password_user.should_not be_valid


end

it "should reject short passwords" do

	short_password = "a" * 5
short_password_user = User.new(@attr.merge(:password => short_password, :password_confirmation => short_password))
short_password_user.should_not be_valid

end

it "should reject long passwords" do

long_password = "a" * 41
long_password_user = User.new(@attr.merge(:password => long_password, :password_confirmation => long_password))
long_password_user.should_not be_valid



end


it "should require a matching password confirmation" do

non_matching_pass_user = User.new(@attr.merge(:password_confirmation => "invalid"))
non_matching_pass_user.should_not be_valid

end

end

describe "encrypted password validation" do

before (:each) do

	@user = User.create!(@attr)

end

it "should have an encrypted password attribute" do

@user.should respond_to(:encrypted_password)

end

it "should set an encrypted password" do

@user.encrypted_password.should_not be_blank

end



describe "has_password? method" do

it "should be true if the passwords match" do

@user.has_password?(@attr[:password]).should be_true

end

it "should be false if the passwords don't match" do

        @user.has_password?("invalid").should be_false

end

end

describe "authenticate method" do

it "should return nil on email/password mismatch" do

wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
wrong_password_user.should be_nil


end

it "should return nil for an email address with no user" do

	nonexistent_user = User.authenticate("bar@foo.com", @attr[:password])
	nonexistent_user.should be_nil

end


it "should return the user on email/password match" do

matching_user = User.authenticate(@attr[:email], @attr[:password])
matching_user.should == @user

end

end

end

end
