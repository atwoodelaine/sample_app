require 'spec_helper'

describe "LayoutLinks" do

	subject {page}
	
	it "should have a Home page at '/'" do
		get '/'
		response.should have_selector('title', :content => "Home") 
	end

	it "should have a Contact page at '/contact'" do
		get '/contact'
		response.should have_selector('title', :content => "Contact")
	end

	it "should have an About page at '/about'" do
		get '/about'
		response.should have_selector('title', :content => "About")
	end

	it "should have a Help page at '/help'" do
		get '/help'
		response.should have_selector('title', :content => "Help")
	end

	it "should have a Sign up page at '/signup' " do
		get '/signup'
		response.should have_selector('title', :content => "Sign up")
	end

	it "should have the right links on the layout" do
		visit root_path
		response.should have_selector('title', :content => "Home")
		click_link "About"
		response.should have_selector('title', :content => "About")
		click_link "Contact"
		response.should have_selector('title', :content => "Contact")
		click_link "Home"
		response.should have_selector('title', :content => "Home")
		click_link "Sign up now!"
		response.should have_selector('title', :content => "Sign up")
		response.should have_selector('a[href="/"]>img')
	end

describe "profile page" do
	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }

	it { should have_content(user.name) }
	it { should have_title(user.name) }
end	

describe "signup page" do
	before { visit signup_path }

	it { should have_content('Sign up') }
	it { should have_title(full_title('Sign up')) }

describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
end
end 
