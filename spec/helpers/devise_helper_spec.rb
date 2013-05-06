require 'spec_helper'

include Devise::TestHelpers
describe DeviseHelper do
 it  "check devise error messages" do
   visit new_user_registration_path
   click_button "Sign up"
   #response.should include("8 errors prohibited this user from being saved:")
   #helper.devise_error_messages!.should contain("8 errors prohibited this user from being saved:")

 end
end
