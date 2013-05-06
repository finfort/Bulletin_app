require 'spec_helper'
describe AdvertisementsController do

  describe "GET #index" do

    it "populates an array of advertisements" do
      advertisement = FactoryGirl.create(:advertisement)
      get :index
      assigns(:advertisements).should eq([advertisement])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end

    it "renders user home page" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      #page.should have_content("Signed in successfully.")
      visit root_path
      #save_and_open_page
      response.should have_content(user.username)
    end
  end

  describe "GET #show" do
    it "assigns the requested advertisement to @advertisement" do
      advertisement = FactoryGirl.create(:advertisement)
      get :show, id: advertisement
      assigns(:advertisement).should eq(advertisement)
    end


    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:advertisement)
      response.should render_template :show
    end
  end

  describe "POST #create" do
    before :each do
      Warden.test_reset!
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end
    context "with valid attributes" do
      it "saves the new advertisement in the database"do
        expect{
        visit root_path
        fill_in "advertisement_content", with: "text"
        click_button "Post"
        }.to change(Advertisement, :count).by(1)
      end

      #it "redirects to the home page" do
      #  post :create, advertisement: FactoryGirl.create(:advertisement)
      #  response.should redirect_to
      #end

      #it "should have a success flash message" do
      #  post :create, advertisement: FactoryGirl.create(:advertisement)
      #  page.should have_content("Advert created!")
      #end
    end

    context "with invalid attributes" do
      it "does not save the advertisement in the database" do
          visit root_path
          fill_in "advertisement_content", with: ""
          click_button "Post"
          expect(page).to render_template("static_pages/home")#have_content("The form contains 1 error.")
      end
    end
  end

  describe "Destroy advertisement" do
    it "should destroy advert" do
      user = FactoryGirl.create(:admin)
      #advertisement= FactoryGirl.create(:advertisement)
      login_as(user, :scope => :user)
      #visit advertisement_path(advertisement)
      advertisement = Advertisement.create!(user_id: user.id, content: "ol")
      #raise user.to_yaml
      #hvisit _path(
      #save_and_open_page
      #click_link "Destroy"
      response.should include("Successfully destroyed advert.")
    end
  end
  describe "PUT 'update'" do

    before(:each) do
      Warden.test_reset!
    end

    context "valid attributes" do
      it "located the requested @advertisement" do
      user = FactoryGirl.create(:admin)
      #@advertisement = FactoryGirl.create(:advertisement)
      @advertisement = Advertisement.create!(user_id:  user.id,content:  "Text" )
      login_as(user, :scope => :user)
       # expect(user.has_role? :admin).to be_true WORKS!
        visit edit_user_registration_path(user)
        @advertisement.reload
        #fill_in "advertisement_content", with: "new text"
        #save_and_open_page
        #click_button "Update Advertisement"
        #expect(page).to render_template("static_page/home")
        #expect(flash[:notice]).to eq("Advert updated!")
        #assigns(:advertisement).should eq(@attr)
        #response.should be_successful
      end

      it "changes @advertisement attributes" do
        #put :update, id: @advertisement,
        #  advertisement: FactoryGirl.attributes_for(:advertisement, content: "text")
        #@advertisement.reload
        #@advertisement.content.should eq("text")
        #save_and_open_page
      end

      it "redirects to the updated advertisement" do
        #put :update, id: @advertisement, advertisement: FactoryGirl.attributes_for(:advertisement)
        #response.should redirect_to root_path#@advertisement
      end
    end

  end

end
