require 'spec_helper'

describe CommentsController do
 describe "POST #create" do
    context "with valid attributes" do
      before :each do
        #Warden.test_reset!
        user = FactoryGirl.create(:admin)
        login_as(user, :scope => :user)
        #raise user.to_yaml
      end
      it "add  new comment in the database"do
        expect{
          advertisement= FactoryGirl.create(:advertisement)
          visit advertisement_path(advertisement)
          fill_in "comment_author_name", with: "name"
          fill_in "comment_site_url", with: "url"
          fill_in "comment_content", with: "comment text"
          click_button "Submit"
        }.to change(Comment, :count).by(1)
      end
      #it "show  new comment added with js", :js => true do
      #  expect{
      #    advertisement= FactoryGirl.create(:advertisement)
      #    visit advertisement_path(advertisement)
      #    fill_in "comment_author_name", with: "name"
      #    fill_in "comment_site_url", with: "url"
      #    fill_in "comment_content", with: "comment text"
      #    click_button "Submit"
      #  }.to change(Comment, :count).by(1)#page.should have_content("comment text")
      #end



      it "render new action when comments fails to create" do
        #        expect{
        #          advertisement= FactoryGirl.create(:advertisement)
        #          visit advertisement_path(advertisement)
        #          fill_in "comment_author_name", with: "name"
        #          fill_in "comment_site_url", with: "url"
        #          fill_in "comment_content", with: ""
        #          click_button "Submit"
        #        }.to render_template :new
        #
      end
    end

    describe "GET /show" do
      #it "renders the #show view" do
      #  get :show, id: FactoryGirl.create(:comment)
      #  response.should render_template :show
      #end

      it "should show comments" do
        #advertisement = FactoryGirl.create(:advertisement)
        #comment = Comment.create!(advertisement_id: advertisement.id, author_name: "name", site_url: "url", content: "Text")
        #get :show, id: advertisement
        #assigns(:advertisement).should eq(advertisement)
      end

    end
    describe "GET /edit" do
      it "should update comment" do

      end
    end
    describe "Delete commment" do
    let(:user) {FactoryGirl.create(:admin)}
    let(:advertisement) {FactoryGirl.create(:advertisement,user_id: user.id )}

    before {
      login_as(user, :scope => :user)
      #@comment= advertisement.comments.build(content: "text", site_url: "url", author_name: "name")
      comment= advertisement.comments.create(content: "text", site_url: "url", author_name: "name")
    }
      it "deletes a comment", js: true do
        #Comment.create(subject: 'The Great Yogurt', body: 'The Schwarz is strong with this one.')
        #advertisement= FactoryGirl.create(:advertisement)
        #raise advertisement.to_yaml
        #@comment_attributes = FactoryGirl.attributes_for(:comment, :advertisement_id => advertisement)
        #post :create, :advertisement_id => advertisement, :comment => @comment_attributes
        #raise @comment.to_yaml
        #raise advertisement.to_yaml
        #visit advertisement_path(advertisement)
        #visit edit_advertisement_comment_path(@comment)
        #save_and_open_page
        #page.should have_content('FactoryText')
        #click_link 'Destroy'
        #page.should have_no_content('FactoryText')
      end
    end

 end


end
