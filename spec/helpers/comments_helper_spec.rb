require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the CommentsHelper. For example:
#
# describe CommentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe CommentsHelper do
  describe "comments count" do
    it "returns the count of comments" do
      comment = FactoryGirl.create(:comment)
      helper.comments_count.should eql("All #{pluralize(Comment.count,"comment")}")
    end
  end

end
