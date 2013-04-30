require 'spec_helper'

describe "UserPages" do
  describe "GET /user_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get user_pages_index_path
      #response..status.should be(200)
    end
  end

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
      page.should have_content("BulletinApp Test Task")
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
