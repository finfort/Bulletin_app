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
    before {
      login_as(user, :scope => :user)
      visit edit_user_registration_path(user) }


    describe "with valid information" do
      let(:new_full_name)  { "New Name Namovich" }
      let(:new_user_name) { "example" }
      before do
        fill_in "user_full_name",             with: new_full_name
        fill_in "user_username",            with: new_user_name
        fill_in "user_current_password", with: user.password
        click_button "Update"
      end

      #it { should have_selector('h1', text: new_user_name) }
      #it { should have_selector('div.alert.alert-success') }
      specify { user.reload.username.should  == new_user_name }
      specify { user.reload.full_name.should == new_full_name }
    end
  end
end
