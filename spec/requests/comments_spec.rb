require 'spec_helper'


describe Comment do
  let(:comment) { FactoryGirl.create(:comment) }

  subject { comment }

  it { should respond_to(:content) }
  it { should respond_to(:author_name) }
  it { should respond_to(:site_url) }

  it { should be_valid }

end
