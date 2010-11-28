require 'spec_helper'

describe "LayoutLinks" do
 
   describe "GET /" do
    it "should have a Home page at /" do
      get '/'
	response.should have_selector("title", :content => "Home")
    end
  end

	describe "Get /contact" do
		it "should have a Contact page at /contact" do
			get '/contact'
			response.should have_selector("title", :content =>"Contact")
		end

	end

		describe "Get /about" do
		it "should have an About page at /about" do
			get '/contact'
			response.should have_selector("title", :content =>"Contact")
		end

	end

			describe "Get /help" do
		it "should have a help page at /help" do
			get '/help'
			response.should have_selector("title", :content =>"Help")
		end

	end

			describe "Get /signup" do
		it "should have a signup page at /signup" do
			get '/signup'
			response.should have_selector("title", :content =>"Sign up")
		end

	end


end
