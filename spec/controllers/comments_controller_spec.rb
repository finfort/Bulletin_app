require 'spec_helper'

describe CommentsController do
 describe "POST #create" do
    context "with valid attributes" do
      before :each do
        #Warden.test_reset!
        user = FactoryGirl.create(:user)
        login_as(user, :scope => :user)
      end
      it "saves the new advertisement in the database"do
        expect{
          advertisement= FactoryGirl.create(:advertisement)
          visit advertisement_path(advertisement)
          fill_in "comment_author_name", with: "name"
          fill_in "comment_site_url", with: "url"
          fill_in "comment_content", with: "comment text"
          click_button "Submit"
        }.to change(Comment, :count).by(1)
      end

      it "render new action when comments fails to create" do
          #advertisement= FactoryGirl.create(:advertisement)
          #comment = FactoryGirl.create(:comment)
          #post :create, id: comment, content: FactoryGirl.attributes_for(:invalid_comment)
          #response.should render_template :new
        #expect{
        #  advertisement= FactoryGirl.create(:advertisement)
        #  visit advertisement_path(advertisement)
        #  click_button "Submit"
        #}.to render_template :new
      end
    end

    describe "GET /show" do

      it "should show comments" do
        #advertisement = FactoryGirl.create(:advertisement)
        #comment = Comment.create!(advertisement_id: advertisement.id, author_name: "name", site_url: "url", content: "Text")
        #get :show, id: advertisement
        #assigns(:advertisement).should eq(advertisement)
      end

    end

 end


end
