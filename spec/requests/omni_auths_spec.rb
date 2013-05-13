require 'spec_helper'

describe "OmniAuths" do
  it "should signup with twitter" do
   #visit omniauth_authorize_path("Twitter", :twitter)
    visit user_omniauth_callback_path(:twitter)
    #fill_in "user_username", with: "omni"
    #fill_in "user_full_name", with: "omni"
    #fill_in "user_username", with: "omni"
    #fill_in "user_email", with: "omni@texst.org"
    #fill_in "user_address", with: "omni"
    #fill_in "user_city", with: "omni"
    #fill_in "user_state", with: "omni"
    #select "Ukraine", :from => "user_country"
    #fill_in "user_zip", with: "3333"
    #click_button "Sign up"
    #save_and_open_page
    #response.should have_content("Signed in!")
  end
  it "should login with twitter" do
     visit user_omniauth_callback_path(:twitter)
    #fill_in "user_username", with: "omni"
    #fill_in "user_full_name", with: "omni"
    #fill_in "user_username", with: "omni"
    #fill_in "user_email", with: "omni@texst.org"
    #fill_in "user_address", with: "omni"
    #fill_in "user_city", with: "omni"
    #fill_in "user_state", with: "omni"
    #select "Ukraine", :from => "user_country"
    #fill_in "user_zip", with: "3333"
    #click_button "Sign up"
    click_link "Logout"
    visit user_omniauth_callback_path(:twitter)
    response.should have_content("Signed successfully.")
  end


end
