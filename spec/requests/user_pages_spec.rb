require 'spec_helper'

describe "UserPages" do
  subject { page  }

  #describe "signup page" do
  #  before  {visit new_user_registration_path}

  #  it { should have_selector('h1',   text: 'Sign up') }
  #  it { should have_selector('title', text: full_title('Sign up')) }
  #end

end

describe "Pages" do

  describe "HomePage" do
    it "should have title Bulletin App Test Task" do
      visit root_path
      page.should have_content("Bulletin app")
    end
  end

  describe "AdvertisementPage" do
    it "should have Advertisement content" do
     visit advertisements_path
     page.should have_content("Advertisements")
    end
  end

  describe "UsersPage" do
    it "should have Users content" do
     visit users_path
     page.should have_content("Users")
    end
  end

end
