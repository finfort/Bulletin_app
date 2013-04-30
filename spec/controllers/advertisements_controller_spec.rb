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
    context "with valid attributes" do
#      it "saves the new advertisement in the database"do
#        expect{
#          post :create, advertisement: FactoryGirl.attributes_for(:advertisement)
#        }.to change(Advertisement, :count).by(1)
#      end
#
      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "does not save the advertisement in the database"
      it "re-renders the home page with error notice"
    end


  end


end
