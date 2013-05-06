require "spec_helper"

describe UserMailer do

  describe "password reset method" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.password_reset(user,"password")}

    it "should deliver successfully" do
      lambda { mail.deliver }.should_not raise_error
    end
    it "should be added to the delivery queue" do
      lambda { mail.deliver }.should change(ActionMailer::Base.deliveries,:size).by(1)
    end

  end

end
