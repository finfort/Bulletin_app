require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the AdvertisementsHelper. For example:
#
# describe AdvertisementsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper do
  describe "#page_title" do
    it "returns the value of @title" do
      #assign(:title, "My Title")
      helper.full_title("My Title").should eql("My Title | BulletinApp Test Task")
    end
    it "returns the value of @title null" do
      helper.full_title("").should eql("BulletinApp Test Task")
    end

  end
end

