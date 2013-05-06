require 'spec_helper'
require "cancan/matchers"

describe "Ability" do
  context "guest ability" do
    user = User.new
    ability = Ability.new(user)
    it {
       ability.can?(:read, :all)
       should be_true
    }
  end


  context "user ability" do
    user = FactoryGirl.create(:user)
    ability = Ability.new(user)
    it {
       ability.can?(:manage, Advertisement.new(:user => user))
       ability.can?(:read, Advertisement)
       ability.can?(:create, Advertisement)


       ability.can?(:manage, Comment.new(:user => user))
       ability.can?(:read, Comment)
       ability.can?(:create, Comment)

       ability.can?(:manage, User)

       ability.cannot?(:manage, Role)

       should be_true
    }
  end
  context "moderator ability" do
    user = FactoryGirl.create(:moderator)
    ability = Ability.new(user)
    it {
       ability.can?(:manage, Advertisement)
       ability.can?(:manage, Comment)
       ability.can?(:read, User)
       should be_true
    }
  end

  context "admin ability" do
    user = FactoryGirl.create(:admin)
    ability = Ability.new(user)
    it {
      ability.can?(:manage, :all)
      should be_true
    }
  end
end
