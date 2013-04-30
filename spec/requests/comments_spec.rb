require 'spec_helper'


describe "Comment" do

  let(:user) { FactoryGirl.create(:user)}
  let(:comment) { FactoryGirl.create(:comment) }
  let(:advertisement) { FactoryGirl.create(:advertisement) }

  subject { comment }

  it { should respond_to(:content) }
  it { should respond_to(:author_name) }
  it { should respond_to(:site_url) }

  it { should be_valid }
    describe "New comments" do

    before :each do
      #advertisement = FactoryGirl.create(:advertisement)
      #user = FactoryGirl.create(:user)
      page.driver.post new_user_session_path, :login => user.login, :password => 'test'
    end

     it "should add comment to database" do
          visit advertisement_path(advertisement)
          page.should have_content("comments")
          #fill_in 'author_name', :with => "TestName"
          #fill_in 'comment_site_url', with: "google.com"
          #fill_in 'comment_content', with: "TestText"
          #expect { click_button 'Submit' }.to change(Comment, :count).by(1)
      end
    end
end
