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

it "should have the right links on the layout" do

	visit root_path
	
	click_link "About"
	response.should have_selector("title", :content =>"About")

	click_link "Help"
	response.should have_selector("title", :content =>"Help")

	click_link "Contact"
	response.should have_selector("title", :content =>"Contact")

	click_link "Home"
	response.should have_selector("title", :content =>"Home")

	click_link "Sign up now!"
	response.should have_selector("title", :content =>"Sign up")

end

end

