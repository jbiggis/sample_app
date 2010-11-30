require 'spec_helper'

describe Micropost do

	before(:each) do
	
		@user = Factory(:user)

		@attr = {:content => "value for content"}
	end
		
	it "should create a new instance given valid attributes" do
		@user.microposts.create!(@attr)
	end	

describe "user associations" do

	before(:each) do
		@micropost = @user.microposts.create!(@attr)
	end

	it "should have a 'user' attribute" do
		@micropost.should respond_to(:user)
	end
	
	it "should have the right associated user" do
		@micropost.user_id.should == @user.id
		@micropost.user.should == @user
	end


end

describe "validations" do

#	before(:each) do
#		@micropost = @user.microposts.create!(@attr)
#	end

	it "should require a user id" do
	
#		@micropost.user_id = nil
#		@micropost.should_not be_valid

		Micropost.new(@attr).should_not be_valid

	end

	it "should require nonblank content" do

#		@micropost.content = ""
#		@micropost.should_not be_valid
		@user.microposts.build(:content => "").should_not be_valid	
	end

	it "should have no more than 140 characters" do
		
#		@micropost.content = "a"*141
#		@micropost.should_not be_valid
		@user.microposts.build(:content => "a"*141).should_not be_valid
	end

end
end