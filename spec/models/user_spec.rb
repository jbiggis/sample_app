require 'spec_helper'

describe User do
  
	
	#	it "should not have a blank input" do
	#		User.name
	#		response.should_not be_blank
	#	end
	#	
	before (:each) do
	@attr = {:name =>"Example User", :email => "user@example.com"}
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
