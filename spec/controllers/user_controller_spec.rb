require 'spec_helper'

describe UsersController do
  before (:each) do
    Warden.test_reset!
  end

  describe "GET show" do
    it "should be successful" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      get :show, :id => user.id
      response.should be_success
    end

    it "should find the right user" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      get :show, :id => user.id
      assigns(:user).should == user
    end

  end

  describe "GET 'index'" do

    it "should show users" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      get :index, :id => user.id
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    let(:user) { FactoryGirl.create(:user) }
    let(:new_full_name)  { "New Name Namovich" }
    let(:new_user_name) { "example" }
    before {
      login_as(user, :scope => :user)
      visit edit_user_registration_path(user) }
    describe "with valid information" do
      it "should edit user" do
        fill_in "user_full_name",             with: new_full_name
        fill_in "user_username",            with: new_user_name
        fill_in "user_current_password", with: user.password
        select "Ukraine", :from => "user_country"
        fill_in "user_current_password", with: "test"
        click_button "Update"
        response.should have_selector('h1', text: new_user_name)
        user.reload.username.should  == new_user_name
      end

      #it { should have_selector('div.alert.alert-success') }

      #it { should have_selector('h1', text: new_user_name) }
      #specify { user.reload.username.should  == new_user_name }
      #specify { user.reload.full_name.should == new_full_name }
    end
  end
end
