require 'spec_helper'
require "cancan/matchers"

describe User do

  before { @user = FactoryGirl.create(:user) }
  subject {@user}

  it {should respond_to(:username)}
  it {should respond_to(:email)}
  it {should respond_to(:full_name)}
  it {should respond_to(:address)}
  it {should respond_to(:city)}
  it {should respond_to(:state)}
  it {should respond_to(:country)}
  it {should respond_to(:zip)}
  it {should respond_to(:birthday)}

  describe "update_with_password" do
    context "when encrypted password is blank" do
      before(:each) do
        @user = FactoryGirl.build(:user)
        @user.save(validate: false)
      end

      it "updates user attributes without asking current password" do
        @user.update_with_password({username: "New First Name"})
        @user.username.should eql "New First Name"
      end

  end
end
end
